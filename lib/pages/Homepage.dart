import 'package:agrigate/pages/SensorData.dart';
import 'package:agrigate/widgets/CropRecommendation.dart';
import 'package:agrigate/widgets/LatestNews.dart';
import 'package:agrigate/widgets/MarketPrice.dart';
import 'package:flutter/material.dart';
import 'package:agrigate/widgets/Weather.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  // Functions Defined Below
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 10.0, top: 20.0),
            child: Text(
              "Welcome,",
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 8.0, top: 5.0),
            child: Text(
              "Hari",
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
          ),
          Weather(),
          const SizedBox(height: 40.0),
          MarketPrice(),
          const SizedBox(height: 40.0),
          SensorData(),
          CropRecommendation(),
          const SizedBox(height: 40.0),
          LatestNews(),
        ],
      ),
    );
  }
}
