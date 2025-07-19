import 'package:football_apps/data/response/league_list_response.dart';
import 'package:football_apps/data/service/league_service.dart';
import 'package:get/get.dart';

class LeagueListController extends GetxController {
  final LeagueService leagueService;
  LeagueListController({required this.leagueService});

  var leagueList = <League>[].obs;
  var isLoading = false.obs;
  var pagingState = Rxn<RemoteState>();
  var currentPage = 1;
  var selectedFilter = '';
  var isSearching = false;
  var searchQuery = '';

  void getLeagueList(String filter, int page) async {
    try {
      isLoading.value = true;
      pagingState.value = RemoteStateLoading();
      // Kirim filter ke service
      final result = await leagueService.getLeagues(page);
      if (page == 1) {
        leagueList.value = result;
      } else {
        leagueList.addAll(result);
      }
      currentPage = page;
      pagingState.value = RemoteStateSuccess();
    } catch (e) {
      pagingState.value = RemoteStateError(e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  void searchLeague(String query, int page) async {
    // Implement search logic with query
  }
}

abstract class RemoteState {}

class RemoteStateLoading extends RemoteState {}

class RemoteStateSuccess extends RemoteState {}

class RemoteStateError extends RemoteState {
  final String error;
  RemoteStateError(this.error);
}
