import 'package:flutter/material.dart';
import 'package:football_apps/controller/league_list%20_controller/league_list_controller.dart';
import 'package:football_apps/widgets/league_item.dart';
import 'package:get/get.dart';

class LeagueListContent extends StatefulWidget {
  const LeagueListContent({super.key});

  @override
  State<LeagueListContent> createState() => _LeagueListContentState();
}

class _LeagueListContentState extends State<LeagueListContent> {
  final ScrollController _scrollController = ScrollController();
  final LeagueListController controller = Get.find();

  @override
  void initState() {
    _scrollController.addListener(_onScroll);
    super.initState();
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent) {
      controller.getLeagueList(
        controller.selectedFilter,
        controller.currentPage + 1,
      );
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.pagingState.value is RemoteStateLoading &&
          controller.leagueList.isEmpty) {
        return const Center(child: CircularProgressIndicator());
      }

      if (controller.pagingState.value is RemoteStateError) {
        final error = (controller.pagingState.value as RemoteStateError).error;
        return Center(child: Text('Error: $error'));
      }

      return GridView.builder(
        controller: _scrollController,
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 8.0,
          crossAxisSpacing: 8.0,
          childAspectRatio: 0.7,
        ),
        itemCount: controller.leagueList.length,
        itemBuilder: (context, index) {
          return LeagueItem(
            league: LeagueData.fromJson(controller.leagueList[index].toJson()),
          );
        },
      );
    });
  }
}
