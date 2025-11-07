import 'package:dio/dio.dart';
import 'package:ffvii_app/models/save.dart';

final dio = Dio();

Future<List<Save>> getAllSaves() async {
  final response = await dio.get<List<dynamic>>('http://localhost:7777/saves');
  final data = response.data as List<dynamic>;
  print(data);
  final List<Save> saves = data
      .map((e) => Save.fromJson(Map<String, dynamic>.from(e as Map)))
      .toList();
  return saves;
}
