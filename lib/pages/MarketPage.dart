import 'package:flutter/material.dart';
import 'package:agrigate/widgets/MarketPageWidgets.dart';

class MarketPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MarketPage();
}

class _MarketPage extends State<MarketPage> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            "Market",
            style: const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 20.0),
          TextField(
            controller: _searchController,
            decoration: InputDecoration(
              hintText: 'Search...',
              // Add a clear button to the search bar
              suffixIcon: IconButton(
                icon: Icon(Icons.clear),
                onPressed: () => _searchController.clear(),
              ),
              // Add a search icon or button to the search bar
              prefixIcon: IconButton(
                icon: Icon(Icons.search),
                onPressed: () {
                  // Perform the search here
                },
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 550,
            padding: EdgeInsets.only(top: 20.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  SizedBox(height: 30.0),
                  GovernmentSubsidySeeds(),
                  SizedBox(height: 30.0),
                  NearbyVendors(),
                  SizedBox(height: 30.0),
                  NearbyWarehouses(),
                  SizedBox(height: 30.0),
                  RentMachinery(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
