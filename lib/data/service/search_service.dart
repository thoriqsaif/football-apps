import 'package:flutter/foundation.dart';
import 'package:football_apps/data/network/dio_api_client.dart';
import 'package:football_apps/data/response/league_list_response.dart';
import 'package:football_apps/data/state/remote_state.dart';

class SearchService {
  Future<RemoteState> searchLeagues(String query, int page) async {
    if (kDebugMode) {
      print('/search/league?query=$query&page=$page');
    }

    final response = await DioApiClient().dio.get(
      '/search/league',
      queryParameters: {'query': query, 'page': page},
    );

    return RemoteStateSuccess<LeagueListResponse>(
      LeagueListResponse.fromJson(response.data),
    );
  }
}
