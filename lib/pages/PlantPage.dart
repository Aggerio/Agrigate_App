import 'package:agrigate/data/Plants.dart';
import 'package:flutter/material.dart';



class PlantPage extends StatelessWidget {
  final int id;
  PlantPage({required this.id});
  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> info = plant_data[id];
    return Container(
      padding: EdgeInsets.all(10.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.network(info['image_link']),
            Text(
              "Name: " + info['name'],
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "Scientific Name: " + info['scientific_name'],
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "Price: " +
                  info['lower_market_price'].toString() +
                  "-" +
                  info['upper_market_price'].toString() +
                  "Rupees",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "Description" + info['description'],
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "Optimal soil Conditions: " + info['optimal_soil_conditions'],
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "Water Consumption: " +
                  info['water_consumption'].toString() +
                  ' m^3/kg',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "Sowing Seaason: " + info['sowing_season'],
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "Harvesting Season: " + info['harvesting_season'],
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "Ideal Companion Crops: " + info['ideal_companion_crops'][0],
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
