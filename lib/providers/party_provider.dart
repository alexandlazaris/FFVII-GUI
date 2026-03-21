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
  }
}