import 'package:flutter/material.dart';

class YouPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "You page",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20.0),
          Text(
            "Info",
            style: TextStyle(fontSize: 22, color: Colors.grey),
          ),
          Card(
            // Customize card properties here
            elevation: 4.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Container(
              // Empty container, you can add child widgets here if needed
              width: MediaQuery.of(context).size.width,
              height: 150.0,
            ),
          ),
          SizedBox(height: 40),
          Text(
            "Settings",
            style: TextStyle(fontSize: 20, color: Colors.grey),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Username: ",
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
              const Text(
                "agam",
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Password: ",
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
              const Text(
                "••••••••••",
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Date of Birth: ",
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
              const Text(
                "31/03/2024",
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
            ],
          ),
          SizedBox(height: 5.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                "See More ⌄",
                style: TextStyle(color: Colors.black),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
