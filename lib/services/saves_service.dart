import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:ffvii_app/models/save.dart';
import 'package:ffvii_app/services/api_service.dart';

final dio = Dio();

Future<List<Save>> getAllSaves() async {
  final response = await dio.get<List<dynamic>>("$apiBaseUrl/saves");
  final data = response.data as List<dynamic>;
  print(data);
  final List<Save> saves = data
      .map((e) => Save.fromJson(Map<String, dynamic>.from(e as Map)))
      .toList();
  return saves;
}

// TODO: why is location passed in as function arg, and not an object of type save?
Future<CreateSaveResponse> createNewSave(String location) async {
  final encodedJson = jsonEncode({"location": location});
  print("encoded json: $encodedJson");
  final response = await dio.post("$apiBaseUrl/saves", data: encodedJson);
  final data = response.data;
  print(data);
  final jsonData = CreateSaveResponse.fromJson(data);
  return jsonData;
  // TODO: check response codes here and throw exceptions if needed
}
