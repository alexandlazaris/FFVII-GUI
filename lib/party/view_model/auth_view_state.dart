class SignInState {
  final bool isLoading;
  final String? errorMessage;
  final String? token;

  const SignInState({this.isLoading = false, this.errorMessage, this.token});

  SignInState copyWith({
    bool? isLoading,
    String? errorMessage,
    String? token,
    bool clearError = false,
  }) {
    return SignInState(
      isLoading: isLoading ?? this.isLoading,
      errorMessage: clearError ? null : errorMessage ?? this.errorMessage,
      token: token ?? this.token,
    );
  }
}
