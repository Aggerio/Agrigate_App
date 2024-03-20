import 'package:agrigate/data/Plants.dart';
import 'package:flutter/material.dart';

class VegetablePrice extends StatelessWidget {
  String url, name, price;
  bool dirn;
  VegetablePrice(
      {required this.url,
      required this.name,
      required this.price,
      required this.dirn});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 20, // Image radius
            backgroundImage: NetworkImage(url),
          ),
          Text(name),
          Text(price),
          Container(
            padding: const EdgeInsets.only(
              left: 10.0,
              top: 5.0,
            ),
            width: 60,
            height: 30,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                width: 1,
                color: (dirn) ? Colors.green : Colors.red,
              ),
            ),
            child: Text(
              '⬆️12%',
              style: TextStyle(color: (dirn) ? Colors.green : Colors.red),
            ),
          ),
        ],
      ),
    );
  }
}

class MarketPrice extends StatelessWidget {
  List<Widget> create_list() {
    List<Widget> outp = [];
    var vegetables = getTodaysMarketPrice();

    for (int i = 0; i < vegetables.length; ++i) {
      var current_veg = vegetables[i];
      outp.add(VegetablePrice(
        url: current_veg['image_link'],
        name: current_veg['name'],
        price: current_veg['lower_market_price'].toString() +
            "-" +
            current_veg['upper_market_price'].toString(),
        dirn: (i % 2 == 0) ? true : false,
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
          padding: const EdgeInsets.only(left: 10.0, bottom: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Today's Market Price",
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
            // [
            //  VegetablePrice(),
            //  VegetablePrice(),
            //  VegetablePrice(),
            //  VegetablePrice(),
            //  VegetablePrice(),
            //  VegetablePrice(),
            //  VegetablePrice(),
            //  VegetablePrice(),
            //  VegetablePrice(),
            //  VegetablePrice(),
            //  VegetablePrice(),
            // ],
          ),
        ),
        SizedBox(height: 20.0),
      ],
    );
  }
}

