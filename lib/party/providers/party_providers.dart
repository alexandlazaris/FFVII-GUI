import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ffvii_app/party/repository/party_repository.dart';

final dioProvider = Provider<Dio>((ref) {
  return Dio();
});

final partyRepositoryProvider = Provider<PartyRepository>((ref) {
  final dio = ref.read(dioProvider);
  return PartyRepository(dio);
});
