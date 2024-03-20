class Plant {
  String name;
  int id;
  String description;
  int market_price_lower, market_price_upper;
  String soil_conditions;
  int water_consumption; //cm
  String sowing_season;
  String harvesting_season;
  String scientific_name;
  List<int> companion_plants;

  Plant({
    required this.name,
    required this.id,
    required this.description,
    required this.market_price_lower,
    required this.market_price_upper,
    required this.soil_conditions,
    required this.water_consumption,
    required this.sowing_season,
    required this.harvesting_season,
    required this.scientific_name,
    required this.companion_plants,
  });
}
