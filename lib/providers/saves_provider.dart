import 'package:ffvii_app/services/saves_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ffvii_app/models/save.dart';

// NOTE: FutureProviders are one time reads
final savesProvider = FutureProvider<List<Save>>((ref) async {
  return getAllSaves();
});

final createSaveProvider =
    AsyncNotifierProvider<CreateSaveNotifier, CreateSaveResponse>(
      CreateSaveNotifier.new,
    );

class CreateSaveNotifier extends AsyncNotifier<CreateSaveResponse> {
  @override
  Future<CreateSaveResponse> build() async {
    throw UnimplementedError('No initial save to create. Waiting for user.');
  }

  Future<CreateSaveResponse> createSave(String location) async {
    state = await AsyncValue.guard(() async {
      return await createNewSave(location);
    });
    return state.requireValue;
  }
}
