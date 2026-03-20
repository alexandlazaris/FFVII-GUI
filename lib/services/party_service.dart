import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:ffvii_app/models/party.dart';
import 'package:ffvii_app/services/api_service.dart';

final dio = Dio();

Future <List<CreatePartyResponse>> createPartyForSave(List<CreateParty> party, String saveId) async {
  final response = await dio.post("$apiBaseUrl/party/$saveId", data: jsonEncode(party));
  final data = response.data as List<dynamic>;
  final json = data.map((e) => CreatePartyResponse.fromJson(Map<String, dynamic>.from(e as Map))).toList();
  return json;
}