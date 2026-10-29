class SignInRequest {
  final String email;
  final String password;

  SignInRequest({required this.email, required this.password});

  // parse model (dart) into request (json)
  Map<String, dynamic> toJson() => {'email': email, 'password': password};
}

class SignInResponse {
  final String accessToken;
  final String refreshToken;

  SignInResponse({required this.accessToken, required this.refreshToken});

  // parse api response (json) into model (dart)
  factory SignInResponse.fromJson(Map<String, dynamic> json) {
    return SignInResponse(
      accessToken: json['access_token'],
      refreshToken: json['refresh_token'],
    );
  }
}
