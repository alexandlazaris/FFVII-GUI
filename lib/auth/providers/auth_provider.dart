import 'package:dio/dio.dart';
import 'package:ffvii_app/auth/repository/auth_repository.dart';
import 'package:ffvii_app/auth/view_model/auth_view_model.dart';
import 'package:ffvii_app/party/view_model/auth_view_state.dart';
import 'package:ffvii_app/services/auth_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final dioProvider = Provider<Dio>((ref) {
  return Dio();
});

// 1. Service provider
final signInServiceProvider = Provider<AuthService>((ref) {
  final dio = ref.watch(dioProvider);
  return AuthService(dio);
});

// 2. Repository provider
final signInRepositoryProvider = Provider<AuthRepository>((ref) {
  final service = ref.watch(signInServiceProvider);

  return AuthRepository(service);
});

// 3. ViewModel provider
final signInViewModelProvider = NotifierProvider<SignInViewModel, SignInState>(
  SignInViewModel.new,
);
