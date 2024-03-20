List<Map<String, dynamic>> plant_data = [
  {
    "id": 1,
    "name": "Wheat",
    "scientific_name": "Triticum aestivum",
    "description":
        "Wheat is a staple cereal grain widely cultivated for its edible seeds.",
    "lower_market_price": 180,
    "upper_market_price": 250,
    "optimal_soil_conditions": "Well-drained loamy soil",
    "water_consumption": 5000,
    "sowing_season": "Late fall to early winter",
    "harvesting_season": "Late spring to early summer",
    "ideal_companion_crops": ["Barley", "Legumes", "Potatoes"],
    "image_link":
        "https://static.vecteezy.com/system/resources/previews/024/865/644/non_2x/wheat-with-ai-generated-free-png.png"
  },
  {
    "id": 2,
    "name": "Rice",
    "scientific_name": "Oryza sativa",
    "description":
        "Rice is a primary food source for more than half of the world's population.",
    "lower_market_price": 120,
    "upper_market_price": 200,
    "optimal_soil_conditions": "Well-drained clayey soil",
    "water_consumption": 15000,
    "sowing_season": "Spring to early summer",
    "harvesting_season": "Late summer to early autumn",
    "ideal_companion_crops": ["Azolla", "Sesame", "Legumes"],
    "image_link":
        "https://www.harvestplus.org/wp-content/uploads/2021/10/zinc-rice-1.png"
  },
  {
    "id": 3,
    "name": "Maize",
    "scientific_name": "Zea mays",
    "description":
        "Maize is a widely cultivated cereal grain with various uses.",
    "lower_market_price": 100,
    "upper_market_price": 180,
    "optimal_soil_conditions": "Well-drained loamy soil",
    "water_consumption": 6000,
    "sowing_season": "Spring",
    "harvesting_season": "Late summer to early autumn",
    "ideal_companion_crops": ["Beans", "Cucurbits", "Potatoes"],
    "image_link":
        "https://5.imimg.com/data5/SELLER/Default/2022/6/PG/NV/NR/10906784/hybrid-maize-corn-seeds-500x500.png"
  },
  {
    "id": 4,
    "name": "Jute",
    "scientific_name": "Corchorus",
    "description":
        "Jute is a long, soft, and shiny fiber used for various textile applications.",
    "lower_market_price": 80,
    "upper_market_price": 120,
    "optimal_soil_conditions": "Well-drained fertile soil",
    "water_consumption": 7000,
    "sowing_season": "Spring",
    "harvesting_season": "Summer",
    "ideal_companion_crops": ["Sunn hemp", "Sesame", "Pulses"],
    "image_link":
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTeRHsLTwQl5FARz61XosFEVjZNetJ4AsvT1jjEkarVOfSOd8Toh_x0WbSbJ-APL8HfXkQ&usqp=CAU"
  },
  {
    "id": 5,
    "name": "Cotton",
    "scientific_name": "Gossypium",
    "description":
        "Cotton is a soft, fluffy staple fiber that grows in a protective case, the boll.",
    "lower_market_price": 150,
    "upper_market_price": 220,
    "optimal_soil_conditions": "Well-drained sandy loam soil",
    "water_consumption": 8000,
    "sowing_season": "Spring",
    "harvesting_season": "Autumn",
    "ideal_companion_crops": ["Legumes", "Wheat", "Barley"],
    "image_link":
        "https://acsa-cotton.org/wp-content/themes/acsa2019/img/Masthead-Cotton.png",
  },
  {
    "id": 6,
    "name": "Sugarcane",
    "scientific_name": "Saccharum officinarum",
    "description":
        "Sugarcane is a tall perennial grass used for sugar production.",
    "lower_market_price": 120,
    "upper_market_price": 180,
    "optimal_soil_conditions": "Well-drained fertile soil",
    "water_consumption": 12000,
    "sowing_season": "Spring",
    "harvesting_season": "Late autumn to winter",
    "ideal_companion_crops": ["Legumes", "Groundnut", "Mustard"],
    "image_link":
        "https://dookan.com/cdn/shop/products/Dookan_Sugarcane_db4918de-842b-40e4-995a-a10346468f2b.webp?v=1693919161"
  },
  {
    "id": 7,
    "name": "Tobacco",
    "scientific_name": "Nicotiana tabacum",
    "description":
        "Tobacco is a product prepared from the leaves of the tobacco plant.",
    "lower_market_price": 200,
    "upper_market_price": 300,
    "optimal_soil_conditions": "Well-drained loamy soil",
    "water_consumption": 9000,
    "sowing_season": "Spring",
    "harvesting_season": "Late summer to early autumn",
    "ideal_companion_crops": ["Legumes", "Cabbage", "Tomatoes"],
    "image_link":
        "https://windycitycigars.com/wp-content/uploads/2023/07/Peterson-Irish-Cask-1.76oz-Pipe-Tobacco2.png"
  },
  {
    "id": 8,
    "name": "Rubber",
    "scientific_name": "Hevea brasiliensis",
    "description":
        "Rubber is produced from latex obtained from the rubber tree.",
    "lower_market_price": 250,
    "upper_market_price": 350,
    "optimal_soil_conditions": "Well-drained loamy soil",
    "water_consumption": 10000,
    "sowing_season": "Spring",
    "harvesting_season": "Varies (latex extraction starts after 6-7 years)",
    "ideal_companion_crops": ["Cacao", "Coffee", "Banana"],
    "image_link":
        "https://leafy-life.com/wp-content/uploads/2023/10/4FIRORS90111.png"
  },
  {
    "id": 9,
    "name": "Coffee",
    "scientific_name": "Coffea",
    "description":
        "Coffee is a brewed drink prepared from roasted coffee beans, the seeds of berries from certain Coffea species.",
    "lower_market_price": 180,
    "upper_market_price": 250,
    "optimal_soil_conditions": "Well-drained acidic soil",
    "water_consumption": 5000,
    "sowing_season": "Spring",
    "harvesting_season": "Late autumn to winter",
    "ideal_companion_crops": ["Banana", "Cardamom", "Citrus"],
    "image_link":
        "https://png.pngtree.com/png-clipart/20230506/original/pngtree-coffee-bean-material-realistic-png-image_9145296.png"
  },
  {
    "id": 10,
    "name": "Tea",
    "scientific_name": "Camellia sinensis",
    "description":
        "Tea is an aromatic beverage commonly prepared by pouring hot or boiling water over cured or fresh tea leaves.",
    "lower_market_price": 120,
    "upper_market_price": 200,
    "optimal_soil_conditions": "Well-drained acidic soil",
    "water_consumption": 4000,
    "sowing_season": "Spring",
    "harvesting_season": "Varies (depends on the type of tea)",
    "ideal_companion_crops": ["Citrus", "Berries", "Flowers"],
    "image_link":
        "https://png.pngtree.com/png-clipart/20210613/original/pngtree-green-tea-plant-tea-health-png-image_6403469.jpg"
  }
];

List<Map<String, dynamic>> getTodaysMarketPrice() {
  List<Map<String, dynamic>> lst = [];
  for (int i = 0; i < 5; ++i) {
    lst.add(plant_data[i]);
  }
  return lst;
}

List<Map<String, dynamic>> getCropRecommendation() {
  List<Map<String, dynamic>> lst = [];
  for (int i = 3; i < 7; ++i) {
    lst.add(plant_data[i]);
  }
  return lst;
}
