import 'package:ffvii_app/auth/model/auth.dart';
import 'package:ffvii_app/services/auth_service.dart';

class AuthRepository {
  final AuthService authService;
  AuthRepository(this.authService);
  Future<SignInResponse> signIn(SignInRequest request) {
    return authService.signIn(request);
  }
}
