import 'package:ffvii_app/auth/model/auth.dart';
import 'package:ffvii_app/auth/providers/auth_provider.dart';
import 'package:ffvii_app/party/view_model/auth_view_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignInViewModel extends Notifier<SignInState> {
  @override
  SignInState build() {
    return const SignInState();
  }

  Future<void> signIn(String email, String password) async {
    // start a signin attempt
    state = state.copyWith(isLoading: true, clearError: true);
    try {
      final repository = ref.read(signInServiceProvider);

      final request = SignInRequest(email: email, password: password);
      final response = await repository.signIn(request);

      // update state after a signin attempt
      state = state.copyWith(isLoading: false, token: response.accessToken);
    } catch (e) {
      // any errors from signin are placed into the state
      state = state.copyWith(isLoading: false, errorMessage: e.toString());
    }
  }
}
