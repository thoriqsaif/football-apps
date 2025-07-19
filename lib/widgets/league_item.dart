import 'package:flutter/material.dart';
import 'package:football_apps/data/response/league_list_response.dart';
import 'package:intl/intl.dart';

class LeagueItem extends StatelessWidget {
  final LeagueData league;
  const LeagueItem({super.key, required this.league});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.network(
            league.league.logo,
            fit: BoxFit.cover,
            color: Colors.black.withOpacity(0.1),
            colorBlendMode: BlendMode.darken,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  league.league.name,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  league.country.name,
                  style: const TextStyle(color: Colors.white70),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class LeagueData {
  final League league;
  final Country country;
  final List<Season> seasons;

  LeagueData({
    required this.league,
    required this.country,
    required this.seasons,
  });

  factory LeagueData.fromJson(Map<String, dynamic> json) {
    return LeagueData(
      league: League.fromJson(json['league']),
      country: Country.fromJson(json['country']),
      seasons: List<Season>.from(
        json['seasons'].map((s) => Season.fromJson(s)),
      ),
    );
  }
}

class LeagueShortInfoView extends StatelessWidget {
  final LeagueData league;

  const LeagueShortInfoView({super.key, required this.league});

  static final DateFormat formatter = DateFormat("yyyy");

  BoxDecoration _gradientBackground() {
    return const BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.bottomCenter,
        end: Alignment.topCenter,
        stops: [0.0, 0.7],
        colors: [Colors.black, Colors.transparent],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final currentSeason = league.seasons.firstWhere(
      (s) => s.current,
      orElse: () => league.seasons.last,
    );

    return Container(
      width: double.infinity,
      height: 200,
      decoration: _gradientBackground(),
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            league.league.name,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 4.0),
          Text(
            league.country.name,
            style: const TextStyle(fontSize: 14, color: Colors.white70),
          ),
          const SizedBox(height: 4.0),
          Text(
            'Musim: ${formatter.format(DateTime.parse(currentSeason.start as String))}',
            style: const TextStyle(fontSize: 12, color: Colors.white60),
          ),
        ],
      ),
    );
  }
}
