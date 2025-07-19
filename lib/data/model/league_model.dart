class League {
  final int id;
  final String name;
  final String logo;
  final Country country;

  League({
    required this.id,
    required this.name,
    required this.logo,
    required this.country,
  });

  factory League.fromJson(Map<String, dynamic> json) {
    return League(
      id: json['league']['id'],
      name: json['league']['name'],
      logo: json['league']['logo'],
      country: Country.fromJson(json['country']),
    );
  }
}

class Country {
  final String name;
  final String code;
  final String flag;

  Country({required this.name, required this.code, required this.flag});

  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(name: json['name'], code: json['code'], flag: json['flag']);
  }
}
