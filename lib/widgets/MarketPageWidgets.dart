import 'package:flutter/material.dart';

class GovernmentSeedWidget extends StatelessWidget {
  String url;
  String name;
  String cost;
  GovernmentSeedWidget(
      {required this.url, required this.name, required this.cost});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Image.network(url, height: 120, width: 200),
          Text(
            name,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          ),
          Text(
            cost,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}

class GovernmentSubsidySeeds extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Government Subsidy Seeds",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            InkWell(
              onTap: () {},
              child: const Text(
                "View all",
                style: TextStyle(color: Colors.blue, fontSize: 16),
              ),
            ),
          ],
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GovernmentSeedWidget(
                url:
                    "https://m.media-amazon.com/images/I/911AapvpO7L._AC_UF1000,1000_QL80_.jpg",
                name: "Wheat Seeds",
                cost: "₹300 per 1000 seeds",
              ),
              GovernmentSeedWidget(
                url:
                    "https://m.media-amazon.com/images/I/911AapvpO7L._AC_UF1000,1000_QL80_.jpg",
                name: "Jute Seeds",
                cost: "₹200 per 1000 seeds",
              ),
              GovernmentSeedWidget(
                url:
                    "https://m.media-amazon.com/images/I/911AapvpO7L._AC_UF1000,1000_QL80_.jpg",
                name: "Rice Seeds",
                cost: "₹800 per 1000 seeds",
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class VendorWidget extends StatelessWidget {
  String url;
  String name;
  VendorWidget({required this.url, required this.name});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Image.network(url, height: 120, width: 200),
          Text(
            name,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}

class NearbyVendors extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Your Nearby Vendors",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            InkWell(
              onTap: () {},
              child: const Text(
                "View all",
                style: TextStyle(color: Colors.blue, fontSize: 16),
              ),
            ),
          ],
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              VendorWidget(
                url:
                    "https://www.shutterstock.com/image-photo/man-selling-fruits-market-sabzi-260nw-1391841260.jpg",
                name: "Pallika Bazaar",
              ),
              VendorWidget(
                url:
                    "https://www.shutterstock.com/image-photo/man-selling-fruits-market-sabzi-260nw-1391841260.jpg",
                name: "Chandni Chowk",
              ),
              VendorWidget(
                url:
                    "https://www.shutterstock.com/image-photo/man-selling-fruits-market-sabzi-260nw-1391841260.jpg",
                name: "Chandpole",
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class WarehouseWidget extends StatelessWidget {
  String url;
  String name;
  String cost;
  WarehouseWidget({required this.url, required this.name, required this.cost});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Image.network(url, height: 120, width: 200),
          Text(
            name,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          ),
          Text(
            cost,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}

class NearbyWarehouses extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Your Nearby Warehouses",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            InkWell(
              onTap: () {},
              child: const Text(
                "View all",
                style: TextStyle(color: Colors.blue, fontSize: 16),
              ),
            ),
          ],
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              WarehouseWidget(
                url:
                    "https://5.imimg.com/data5/SELLER/Default/2023/5/306977467/WP/DK/AA/28081873/prefabricated-warehouse-shed.jpg",
                name: "Kishanlal Warehouse",
                cost: "₹300-500 per hr",
              ),
              WarehouseWidget(
                url:
                    "https://5.imimg.com/data5/SELLER/Default/2023/5/306977467/WP/DK/AA/28081873/prefabricated-warehouse-shed.jpg",
                name: "Premchand Storage Solutions",
                cost: "₹400-600 per hr",
              ),
              WarehouseWidget(
                url:
                    "https://5.imimg.com/data5/SELLER/Default/2023/5/306977467/WP/DK/AA/28081873/prefabricated-warehouse-shed.jpg",
                name: "Kotharilal Services",
                cost: "₹100-200 per hr",
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class RentMachineryWidget extends StatelessWidget {
  String url;
  String name;
  String cost;
  RentMachineryWidget(
      {required this.url, required this.name, required this.cost});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Image.network(url, height: 120, width: 200),
          Text(
            name,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          ),
          Text(
            cost,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}

class RentMachinery extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Rent Machinery",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            InkWell(
              onTap: () {},
              child: const Text(
                "View all",
                style: TextStyle(color: Colors.blue, fontSize: 16),
              ),
            ),
          ],
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              RentMachineryWidget(
                url:
                    "https://www.rushlane.com/wp-content/uploads/2021/01/mahindra-tractor-sales-dec-2020-1.jpg",
                name: "Tractor",
                cost: "₹100 per hour",
              ),
              RentMachineryWidget(
                url:
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSaqFWvLxUmkxGyPFjhIQnCzvwpSuYxVMKvjA",
                name: "Harvester",
                cost: "₹100 per hour",
              ),
              RentMachineryWidget(
                url:
                    "https://3.imimg.com/data3/TY/KI/MY-2259091/subsoil-plough-500x500.jpg",
                name: "Plough",
                cost: "₹50 per hour",
              ),
            ],
          ),
        ),
      ],
    );
  }
}
