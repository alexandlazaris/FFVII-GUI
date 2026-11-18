import 'package:ffvii_app/start_game/view/start_game_menu_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ffvii_app/auth/providers/auth_provider.dart';

class SignInScreen extends ConsumerStatefulWidget {
  const SignInScreen({super.key});

  @override
  ConsumerState<SignInScreen> createState() => _SignInViewState();
}

class _SignInViewState extends ConsumerState<SignInScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(signInViewModelProvider);
    ref.listen(signInViewModelProvider, (previous, next) {
      // Only navigate when the token changes from null to non-null
      if (previous?.token == null && next.token != null) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => StarGameMenuPage()),
        );
      }
    });

    return Scaffold(
      appBar: AppBar(title: const Text('Sign In')),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            // Email input
            TextField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                labelText: 'Email',
                hintText: 'Enter your email',
              ),
            ),

            const SizedBox(height: 16),

            // Password input
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Password',
                hintText: 'Enter your password',
              ),
            ),

            const SizedBox(height: 24),

            // Sign in button
            ElevatedButton(
              onPressed: state.isLoading
                  ? null
                  : () {
                      ref
                          .read(signInViewModelProvider.notifier)
                          .signIn(
                            _emailController.text.trim(),
                            _passwordController.text,
                          );
                    },
              child: state.isLoading
                  ? const CircularProgressIndicator()
                  : const Text('Sign In'),
            ),

            // Error message
            if (state.errorMessage != null) ...[
              const SizedBox(height: 16),
              Text(
                state.errorMessage!,
                style: const TextStyle(color: Colors.red),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
