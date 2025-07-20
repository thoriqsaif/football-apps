import 'package:flutter/material.dart';
import 'package:football_apps/controller/league_list%20_controller/league_list_controller.dart';
import 'package:football_apps/screen/league_list_screen/league_list_content.dart';
import 'package:get/get.dart';

class LeagueListScreen extends StatefulWidget {
  const LeagueListScreen({super.key});

  @override
  State<LeagueListScreen> createState() => _LeagueListScreenState();
}

class _LeagueListScreenState extends State<LeagueListScreen> {
  final LeagueListController leagueListController = Get.find();

  @override
  void initState() {
    super.initState();
    Future.microtask(() async {
      try {
        if (leagueListController.leagueList.isEmpty) {
          leagueListController.getLeagueList(
            leagueListController.selectedFilter,
            leagueListController.currentPage,
          );
        }
      } catch (e, stack) {
        debugPrint('Error in LeagueListScreen initState: $e');
        debugPrintStack(stackTrace: stack);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: LeagueListContent());
  }
}
