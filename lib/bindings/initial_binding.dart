import 'package:football_apps/controller/league_list%20_controller/league_list_controller.dart';
import 'package:get/get.dart';
import 'package:football_apps/data/service/league_service.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(LeagueService());
    Get.put(LeagueListController(leagueService: Get.find()));
  }
}
