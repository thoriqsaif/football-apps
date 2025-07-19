import 'package:football_apps/controller/league_list%20_controller/league_list_controller.dart';
import 'package:football_apps/data/service/league_service.dart';
import 'package:get/get.dart';

class LeagueBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LeagueService(), fenix: true);
    Get.lazyPut(
      () => LeagueListController(leagueService: Get.find()),
      fenix: true,
    );
  }
}
