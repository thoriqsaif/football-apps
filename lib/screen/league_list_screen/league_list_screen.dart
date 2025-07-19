import 'package:flutter/material.dart';
import 'package:football_apps/screen/league_list_screen/league_list_content.dart';

class LeagueListScreen extends StatelessWidget {
  const LeagueListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: LeagueListContent());
  }
}
