import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:ffvii_app/auth/model/auth.dart';
import 'package:ffvii_app/services/api_service.dart';

class AuthService {
  final Dio dio;
  AuthService(this.dio);

  Future<SignInResponse> signIn(SignInRequest request) async {
    // logging request data only
    final encodedJson = jsonEncode({
      "email": request.email,
      "password": request.password,
    });
    print("encoded json: $encodedJson");

    final response = await dio.post(
      "$apiBaseUrl/auth/login",
      data: request.toJson(),
    );
    final data = response.data;
    print(data);

    return SignInResponse.fromJson(
      Map<String, dynamic>.from(response.data as Map),
    );
  }
}
