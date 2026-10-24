# Flutter Web Game App — Development Plan

## 1. Overview

Build a Flutter web application using Riverpod for state management. The application supports authentication, email verification, user profiles, game save management, and logout.

## 2. Technology and Architecture

- Framework: Flutter Web
- State management: Riverpod
- Routing: go_router (recommended)
- Authentication: AuthService abstraction over the selected backend
- Authentication state: StreamProvider or equivalent
- Authentication actions: AsyncNotifier
- Game data: Separate save repository and providers
- Testing: Unit, widget, and integration tests

Open decisions:
- Authentication backend: Firebase Auth, Supabase Auth, or custom API
- Riverpod code generation or manual providers
- Save-state storage backend
- Email verification requirements

## 3. User Flows

### App launch
1. Initialize and restore the authentication session.
2. Show a loading screen until authentication state is resolved.
3. If signed out, show the welcome screen and Start button.
4. Start opens Login and Sign Up options.

### Login
1. Collect email and password.
2. Validate input.
3. Submit credentials through AuthController.
4. Show loading and actionable errors.
5. Let authentication state drive navigation after success.

### Sign up and verification
1. Collect email, password, and password confirmation.
2. Validate input and matching passwords.
3. Create the account and send a verification email.
4. Show a verification-pending screen with a resend option.
5. Configure the verification link to return to the web app.
6. Restore or refresh the session and reload verification status.
7. Allow protected game access only when authentication requirements are satisfied.

### Game selection
- New Game: Create a save associated with the current user and initialize gameplay.
- Continue: List the current user's saves and allow one to be resumed.
- Show an empty state when no saves exist.
- Display relevant save metadata, such as name, progress, and last-played time.

### Profile and logout
- Display email, available profile details, and verification status where relevant.
- Provide a logout action.
- On logout, end the session, clear user-specific state and caches, and return to the welcome screen.
- Prevent access to protected routes and data after logout.

## 4. Proposed Project Structure

```text
lib/
  app/
    app.dart
    router.dart
    app_providers.dart
  core/
    errors/
    validation/
  features/
    auth/
      data/auth_service_impl.dart
      domain/auth_service.dart
      domain/auth_user.dart
      providers/auth_state_provider.dart
      providers/auth_controller.dart
      presentation/welcome_screen.dart
      presentation/login_screen.dart
      presentation/signup_screen.dart
      presentation/verify_email_screen.dart
    profile/
      presentation/profile_screen.dart
    game_saves/
      data/save_repository_impl.dart
      domain/game_save.dart
      domain/save_repository.dart
      providers/
      presentation/game_selection_screen.dart
    game/
      presentation/game_screen.dart
  main.dart
```

Adjust the structure to the project's size and existing conventions.

## 5. Riverpod Design

### AuthService
Define an interface responsible for:
- Observing authentication changes
- Exposing the current user
- Signing in and signing out
- Creating accounts
- Sending verification emails
- Refreshing verification status

Translate backend-specific users and errors into application-owned models.

### Authentication state
- Use a StreamProvider or equivalent for the authentication SDK's session stream.
- Represent initialization, signed-out, authenticated, and verification-required states appropriately.
- Do not interpret an unresolved stream as proof that the user is signed out.
- Avoid maintaining a second independently mutable copy of the current user.

### AuthController
Use an AsyncNotifier or equivalent for login, signup, verification-related actions, and logout. Keep action loading and error state separate from the authentication stream, which remains the source of truth for the session.

### User-specific providers
- Current user and profile
- User game saves
- Individual save details

Key user-specific providers by authenticated user ID where appropriate. Invalidate or refresh user-specific caches when the session ends or the user changes.

## 6. Routing and Access Control

Use declarative routing, preferably go_router, with redirects based on authentication state.

| State | Permitted screens |
|---|---|
| Initializing | Loading screen |
| Signed out | Welcome, login, sign up |
| Verification required | Verification screen and permitted auth actions |
| Authenticated and verified | Game selection, game, profile |

Requirements:
- Support deep links and browser refreshes.
- Avoid redirect loops.
- Configure the email verification callback or continuation URL.
- Ensure browser back and forward navigation respects the current session.
- Enforce data access rules on the backend; client-side route guards alone are insufficient.

## 7. Game Save Management and Security

The save repository should support creating, listing, loading, and updating saves. Deletion can be added if required.

Requirements:
- Associate each save with a stable authenticated user ID.
- Verify ownership on every protected backend read and write.
- Never rely solely on client-side filtering for security.
- Clear cached saves when users log out or switch accounts.
- Handle missing or invalid saves gracefully.

## 8. Implementation Phases

### Phase 1 — Application foundation
- [ ] Configure Flutter Web and Riverpod.
- [ ] Set up the app entry point and routing.
- [ ] Create the welcome screen and Start button.
- [ ] Add placeholder authentication, profile, and game screens.
- [ ] Establish loading and error UI patterns.

Deliverable: Navigable application skeleton.

### Phase 2 — Authentication abstraction
- [ ] Define AuthUser and AuthService.
- [ ] Add the service provider and authentication-state provider.
- [ ] Add the authentication controller.
- [ ] Implement a fake service for development and tests.
- [ ] Define authentication and verification states.
- [ ] Add controller unit tests.

Deliverable: Testable authentication architecture independent of a backend.

### Phase 3 — Backend integration
- [ ] Select and configure the authentication provider.
- [ ] Implement the concrete AuthService.
- [ ] Implement login and signup.
- [ ] Implement email verification and resend behavior.
- [ ] Configure web callback URLs and authorized domains.
- [ ] Implement session restoration and user refresh.
- [ ] Normalize authentication errors.
- [ ] Test refresh and browser-session behavior.

Deliverable: Working authentication and email verification.

### Phase 4 — Routing and logout
- [ ] Connect router redirects to authentication state.
- [ ] Handle initial session loading.
- [ ] Protect routes requiring verified accounts.
- [ ] Implement logout and user-state cleanup.
- [ ] Test protected URLs and browser navigation.

Deliverable: Authentication-driven navigation.

### Phase 5 — Profile
- [ ] Display user email and available profile details.
- [ ] Display verification status where relevant.
- [ ] Implement logout.
- [ ] Handle loading and error states.

Deliverable: Working profile screen.

### Phase 6 — Game saves
- [ ] Define the game save model and repository interface.
- [ ] Implement save creation and listing.
- [ ] Implement loading and resuming saves.
- [ ] Build the Continue screen and empty state.
- [ ] Enforce backend ownership checks.
- [ ] Invalidate user-specific providers when accounts change.

Deliverable: User-specific save management.

### Phase 7 — Testing and hardening
- [ ] Unit-test authentication logic.
- [ ] Widget-test the primary screens.
- [ ] Integration-test login and logout.
- [ ] Test verification-link return behavior.
- [ ] Test session restoration and expired sessions.
- [ ] Test switching between users.
- [ ] Verify unauthorized save access is rejected.
- [ ] Test loading, empty, success, and error states.
- [ ] Verify production web configuration.

Deliverable: Tested application ready for deployment.

## 9. Acceptance Criteria

- [ ] App shows a loading state while restoring authentication.
- [ ] Signed-out users see the welcome screen and Start button.
- [ ] Users can navigate to login and signup.
- [ ] Login validates credentials and handles failures.
- [ ] Signup validates email, password, and password confirmation.
- [ ] Verification emails can be sent and resent appropriately.
- [ ] Verification links return users to the web app.
- [ ] Verification status is refreshed before protected access.
- [ ] Users can create, list, and resume their own saves.
- [ ] Users can access their profile and log out.
- [ ] Logout returns the app to the welcome screen.
- [ ] Protected data is inaccessible after logout.
- [ ] Browser refresh restores the correct authentication state.
- [ ] Direct navigation respects authentication requirements.
- [ ] Backend authorization prevents cross-user save access.

## 10. Open Decisions

1. Which authentication backend will be used?
2. Is go_router already installed?
3. Will Riverpod code generation be used?
4. Where will save states be persisted?
5. Is email verification mandatory before gameplay?
6. Should sessions persist across browser restarts?
7. Is an email-only profile sufficient for the first release?
8. Are save deletion, renaming, and multiple slots required?

## 11. Development Principles

- Keep authentication SDK details inside the service implementation.
- Use Riverpod for reactive state and dependency injection.
- Let authentication state drive navigation.
- Avoid duplicate mutable copies of the current user.
- Separate game save logic from authentication logic.
- Clear user-specific state when sessions end or accounts change.
- Enforce authorization on the backend.
- Implement and test the smallest end-to-end flow before expanding features.

## First Milestone

Complete the application skeleton, define authentication abstractions, and implement a mock authentication flow. Select and integrate the backend before building the complete game save experience.