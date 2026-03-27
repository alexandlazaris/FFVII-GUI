import 'package:dio/dio.dart';
import 'package:ffvii_app/party/model/party.dart';
import 'package:ffvii_app/services/api_service.dart';

class PartyRepository {
  final Dio _dio;

  PartyRepository(this._dio);

  Future<List<CreatePartyResponse>> createPartyForSave(
    List<CreateParty> parties,
    String saveId,
  ) async {
    try {
      final response = await _dio.post(
        "$apiBaseUrl/party/$saveId",
        data: parties.map((e) => e.toJson()).toList(),
      );

      final data = response.data;

      if (data is! List) {
        throw Exception("Invalid response format");
      }
      return data
          .map(
            (e) => CreatePartyResponse.fromJson(Map<String, dynamic>.from(e)),
          )
          .toList();
    } on DioException catch (e) {
      throw Exception(e.response?.data ?? e.message ?? "Unknown network error");
    } catch (e) {
      throw Exception("Unexpected error; $e");
    }
  }
}
