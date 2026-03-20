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

Future<CreateSaveResponse> createNewSave(String location) async {
  final response = await dio.post(
    "$apiBaseUrl/saves",
    data: jsonEncode({"location": location}),
  );
  final data = response.data;
  print(data);
  final jsonData = CreateSaveResponse.fromJson(data);
  return jsonData;
}
