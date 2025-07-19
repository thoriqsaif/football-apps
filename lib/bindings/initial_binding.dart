import 'package:get/get.dart';
import 'package:football_apps/data/service/league_service.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LeagueService());
  }
}
