import 'package:agrigate/data/Animals.dart';
import 'package:agrigate/data/Plants.dart';
import 'package:agrigate/pages/PlantPage.dart';
import 'package:agrigate/pages/AnimalPage.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SearchPage();
}

class _SearchPage extends State<SearchPage> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          bottom: const TabBar(
            tabs: [
              Tab(
                text: "Plants",
              ),
              Tab(
                text: "Animals",
              ),
            ],
          ),
          title: const Text(
            "Search",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
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
                height: 500,
                padding: EdgeInsets.only(
                  top: 20.0,
                ),
                child: TabBarView(
                  children: [
                    PlantResult(),
                    AnimalResult(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PlantResult extends StatelessWidget {
  String? searchQuery;
  PlantResult({this.searchQuery});
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      scrollDirection: Axis.vertical,
      padding: EdgeInsets.all(4.0),
      mainAxisSpacing: 4.0,
      crossAxisSpacing: 4.0,
      children: plant_data.map(
        (Map<String, dynamic> item) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => PlantPage(id: item['id'] - 1)),
              );
            },
            child: GridTile(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.network(
                      item['image_link'],
                      height: 120,
                      width: 250,
                      fit: BoxFit.cover,
                    ),
                    Text(
                      item['name'],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ).toList(),
    );
  }
}

class AnimalResult extends StatelessWidget {
  String? searchQuery;
  AnimalResult({this.searchQuery});
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      scrollDirection: Axis.vertical,
      padding: EdgeInsets.all(4.0),
      mainAxisSpacing: 4.0,
      crossAxisSpacing: 4.0,
      children: animal_data.map(
        (Map<String, dynamic> item) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => AnimalPage(id: item['id'] - 1)),
              );
            },
            child: GridTile(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.network(
                    item['image_link'],
                    height: 120,
                    width: 300,
                    fit: BoxFit.cover,
                  ),
                  Text(
                    item['name'],
                  ),
                ],
              ),
            ),
          );
        },
      ).toList(),
    );
  }
}
