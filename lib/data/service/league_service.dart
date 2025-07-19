import 'package:dio/dio.dart';
import 'package:football_apps/data/network/dio_api_client.dart';
import 'package:football_apps/data/response/league_list_response.dart';

class LeagueService {
  final Dio _dio = DioApiClient().dio;

  Future<List<League>> getLeagues(int page) async {
    final response = await _dio.get('leagues', queryParameters: {'page': page});
    final data = response.data['response'] as List;
    return data.map((e) => League.fromJson(e)).toList();
  }
}


  // Future<RemoteState> fetchLeagueDetails(int leagueId) async {
  //   final response = await DioApiClient().dio.get('$serviceName/$leagueId');
  //   return RemoteStateSuccess<LeagueDetailResponse>(
  //     LeagueDetailResponse.fromJson(response.data),
  //   );
  // }
