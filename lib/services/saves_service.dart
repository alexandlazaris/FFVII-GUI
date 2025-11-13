import 'package:dio/dio.dart';
import 'package:ffvii_app/models/save.dart';

final dio = Dio();

const String apiBaseUrl = String.fromEnvironment(
  'apiBaseUrl',
  defaultValue: 'http://localhost:7777',
);

Future<List<Save>> getAllSaves() async {
  final response = await dio.get<List<dynamic>>("$apiBaseUrl/saves");
  final data = response.data as List<dynamic>;
  print(data);
  final List<Save> saves = data
      .map((e) => Save.fromJson(Map<String, dynamic>.from(e as Map)))
      .toList();
  return saves;
}
