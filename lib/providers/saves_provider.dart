import 'package:ffvii_app/services/saves_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ffvii_app/models/save.dart';

final savesProvider = FutureProvider<List<Save>>((ref) async {
  return getAllSaves();
});
