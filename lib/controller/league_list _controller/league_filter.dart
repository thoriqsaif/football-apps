enum LeagueFilter {
  all(name: 'all'),
  premierLeague(name: 'premier_league'),
  laLiga(name: 'la_liga'),
  serieA(name: 'serie_a'),
  bundesliga(name: 'bundesliga'),
  ligue1(name: 'ligue_1');

  const LeagueFilter({required this.name});
  final String name;
}
