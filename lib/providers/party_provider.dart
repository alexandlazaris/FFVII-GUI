import 'package:ffvii_app/models/party.dart';
import 'package:ffvii_app/services/party_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final createPartyProvider =
    AsyncNotifierProvider<CreatePartyNotifier, List<CreatePartyResponse>>(
      CreatePartyNotifier.new,
    );

class CreatePartyNotifier extends AsyncNotifier<List<CreatePartyResponse>> {
  @override
  Future<List<CreatePartyResponse>> build() async {
    // This runs when the provider is first created
    // For a POST use-case, you usually don't need initial data
    return [];
  }

  Future<void> createParty(List<CreateParty> items, saveId) async {
    state = await AsyncValue.guard(() async {
      return await createPartyForSave(
        items,
        saveId,
      );
    });
    // state = const AsyncLoading();

    // try {
    //   final result = await createPartyForSave(
    //     items,
    //     "ddec9fa3-0579-405b-8c4d-8cb07a318040",
    //   );

    //   state = AsyncData(result);
    // } catch (e, st) {
    //   state = AsyncError(e, st);
    // }
  }
}