import 'package:flutter/material.dart';
import 'package:football_apps/data/response/league_list_response.dart';
import 'package:get/get.dart';

class LeagueDetailScreen extends StatelessWidget {
  const LeagueDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final League league = Get.arguments;

    return Scaffold(
      appBar: AppBar(title: Text(league.name)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(league.logo, height: 100),
            const SizedBox(height: 16),
            Text('Country: ${league.country.name}'),
            const SizedBox(height: 8),
            Text('Founded: ${league.founded ?? 'Unknown'}'),
            const SizedBox(height: 8),
            Text('Seasons: ${league.seasons.length} seasons'),
          ],
        ),
      ),
    );
  }
}
