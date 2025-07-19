// To parse this JSON data, do
//
//     final leagueListResponse = leagueListResponseFromJson(jsonString);

import 'dart:convert';

import 'package:football_apps/widgets/league_item.dart';

LeagueListResponse leagueListResponseFromJson(String str) =>
    LeagueListResponse.fromJson(json.decode(str));

String leagueListResponseToJson(LeagueListResponse data) =>
    json.encode(data.toJson());

class LeagueListResponse {
  String leagueListResponseGet;
  Parameters parameters;
  List<dynamic> errors;
  int results;
  Paging paging;
  List<Response> response;

  LeagueListResponse({
    required this.leagueListResponseGet,
    required this.parameters,
    required this.errors,
    required this.results,
    required this.paging,
    required this.response,
  });

  factory LeagueListResponse.fromJson(Map<String, dynamic> json) =>
      LeagueListResponse(
        leagueListResponseGet: json["get"],
        parameters: Parameters.fromJson(json["parameters"]),
        errors: List<dynamic>.from(json["errors"].map((x) => x)),
        results: json["results"],
        paging: Paging.fromJson(json["paging"]),
        response: List<Response>.from(
          json["response"].map((x) => Response.fromJson(x)),
        ),
      );

  Map<String, dynamic> toJson() => {
    "get": leagueListResponseGet,
    "parameters": parameters.toJson(),
    "errors": List<dynamic>.from(errors.map((x) => x)),
    "results": results,
    "paging": paging.toJson(),
    "response": List<dynamic>.from(response.map((x) => x.toJson())),
  };
}

class Paging {
  int current;
  int total;

  Paging({required this.current, required this.total});

  factory Paging.fromJson(Map<String, dynamic> json) =>
      Paging(current: json["current"], total: json["total"]);

  Map<String, dynamic> toJson() => {"current": current, "total": total};
}

class Parameters {
  String id;

  Parameters({required this.id});

  factory Parameters.fromJson(Map<String, dynamic> json) =>
      Parameters(id: json["id"]);

  Map<String, dynamic> toJson() => {"id": id};
}

class Response {
  League league;
  Country country;
  List<Season> seasons;

  Response({
    required this.league,
    required this.country,
    required this.seasons,
  });

  factory Response.fromJson(Map<String, dynamic> json) => Response(
    league: League.fromJson(json["league"]),
    country: Country.fromJson(json["country"]),
    seasons: List<Season>.from(json["seasons"].map((x) => Season.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "league": league.toJson(),
    "country": country.toJson(),
    "seasons": List<dynamic>.from(seasons.map((x) => x.toJson())),
  };
}

class Country {
  String name;
  String code;
  String flag;

  Country({required this.name, required this.code, required this.flag});

  factory Country.fromJson(Map<String, dynamic> json) =>
      Country(name: json["name"], code: json["code"], flag: json["flag"]);

  Map<String, dynamic> toJson() => {"name": name, "code": code, "flag": flag};
}

class League {
  int id;
  String name;
  String type;
  String logo;

  League({
    required this.id,
    required this.name,
    required this.type,
    required this.logo,
  });

  factory League.fromJson(Map<String, dynamic> json) => League(
    id: json["id"],
    name: json["name"],
    type: json["type"],
    logo: json["logo"],
  );

  get country => null;

  get founded => null;

  get seasons => null;

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "type": type,
    "logo": logo,
  };

  static fromLeagueData(LeagueData e) {}
}

class Season {
  int year;
  DateTime start;
  DateTime end;
  bool current;
  Coverage coverage;

  Season({
    required this.year,
    required this.start,
    required this.end,
    required this.current,
    required this.coverage,
  });

  factory Season.fromJson(Map<String, dynamic> json) => Season(
    year: json["year"],
    start: DateTime.parse(json["start"]),
    end: DateTime.parse(json["end"]),
    current: json["current"],
    coverage: Coverage.fromJson(json["coverage"]),
  );

  Map<String, dynamic> toJson() => {
    "year": year,
    "start":
        "${start.year.toString().padLeft(4, '0')}-${start.month.toString().padLeft(2, '0')}-${start.day.toString().padLeft(2, '0')}",
    "end":
        "${end.year.toString().padLeft(4, '0')}-${end.month.toString().padLeft(2, '0')}-${end.day.toString().padLeft(2, '0')}",
    "current": current,
    "coverage": coverage.toJson(),
  };
}

class Coverage {
  Fixtures fixtures;
  bool standings;
  bool players;
  bool topScorers;
  bool topAssists;
  bool topCards;
  bool injuries;
  bool predictions;
  bool odds;

  Coverage({
    required this.fixtures,
    required this.standings,
    required this.players,
    required this.topScorers,
    required this.topAssists,
    required this.topCards,
    required this.injuries,
    required this.predictions,
    required this.odds,
  });

  factory Coverage.fromJson(Map<String, dynamic> json) => Coverage(
    fixtures: Fixtures.fromJson(json["fixtures"]),
    standings: json["standings"],
    players: json["players"],
    topScorers: json["top_scorers"],
    topAssists: json["top_assists"],
    topCards: json["top_cards"],
    injuries: json["injuries"],
    predictions: json["predictions"],
    odds: json["odds"],
  );

  Map<String, dynamic> toJson() => {
    "fixtures": fixtures.toJson(),
    "standings": standings,
    "players": players,
    "top_scorers": topScorers,
    "top_assists": topAssists,
    "top_cards": topCards,
    "injuries": injuries,
    "predictions": predictions,
    "odds": odds,
  };
}

class Fixtures {
  bool events;
  bool lineups;
  bool statisticsFixtures;
  bool statisticsPlayers;

  Fixtures({
    required this.events,
    required this.lineups,
    required this.statisticsFixtures,
    required this.statisticsPlayers,
  });

  factory Fixtures.fromJson(Map<String, dynamic> json) => Fixtures(
    events: json["events"],
    lineups: json["lineups"],
    statisticsFixtures: json["statistics_fixtures"],
    statisticsPlayers: json["statistics_players"],
  );

  Map<String, dynamic> toJson() => {
    "events": events,
    "lineups": lineups,
    "statistics_fixtures": statisticsFixtures,
    "statistics_players": statisticsPlayers,
  };
}
