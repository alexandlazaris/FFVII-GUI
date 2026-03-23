import 'package:ffvii_app/party/model/party.dart';
import 'package:ffvii_app/party/repository/party_repository.dart';
import 'package:ffvii_app/party/providers/party_providers.dart';
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

  Future<void> createParty(List<String> names, String saveId) async {
    final PartyRepository repo = ref.read(partyRepositoryProvider);
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final filtered = names
          .where((e) => e.trim().isNotEmpty)
          .map((e) => CreateParty(name: e))
          .toList();
      return await repo.createPartyForSave(filtered, saveId);
    });
  }
}
