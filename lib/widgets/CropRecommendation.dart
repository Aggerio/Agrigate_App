import 'package:agrigate/data/Plants.dart';
import 'dart:math';
import 'package:flutter/material.dart';

class CropRecommendationWidget extends StatelessWidget {
  String name;
  int feasibility;
  String projected_price;
  String url;
  CropRecommendationWidget(
      {required this.name,
      required this.feasibility,
      required this.projected_price,
      required this.url});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          width: 1,
          color: Colors.grey,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(
            radius: 20,
            backgroundImage: NetworkImage(url),
          ),
          Text(name),
          Text(
            "${feasibility}% Crop Feasibility",
            style: TextStyle(
              color: Colors.green,
              fontSize: 18.0,
            ),
          ),
          Text(
            "projected price: ₹${projected_price}kg",
            style: const TextStyle(
              color: Colors.black,
            ),
          )
        ],
      ),
    );
  }
}

class CropRecommendation extends StatelessWidget {
  List<Widget> create_list() {
    List<Widget> outp = [];
    var vegetables = getCropRecommendation();

    for (int i = 0; i < vegetables.length; ++i) {
      var current_veg = vegetables[i];
      outp.add(SizedBox(width: 20.0));
      outp.add(CropRecommendationWidget(
        url: current_veg['image_link'],
        name: current_veg['name'],
        projected_price: current_veg['lower_market_price'].toString() +
            "-" +
            current_veg['upper_market_price'].toString(),
        feasibility: Random().nextInt(98 - 85 + 1) + 85,
      ));
    }
    return outp;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 10.0, bottom: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Crop Recommendation",
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              InkWell(
                onTap: () => Navigator.of(context).pushNamed('/crop_prices'),
                child: Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: Text(
                    "View All",
                    style: const TextStyle(
                      color: Colors.blue,
                      fontSize: 15.0,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: create_list(),
            //SizedBox(width: 10.0),
            //CropRecommendationWidget(),
            //SizedBox(width: 10.0),
            //CropRecommendationWidget(),
            //SizedBox(width: 10.0),
            //CropRecommendationWidget(),
            //SizedBox(width: 10.0),
            //CropRecommendationWidget(),
          ),
        )
      ],
    );
  }
}

