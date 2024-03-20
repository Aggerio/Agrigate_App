import 'package:flutter/material.dart';

class Weather extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30.0, top: 10.0),
      child: Container(
        width: 300,
        height: 100,
        decoration: BoxDecoration(
          border: Border.all(
            width: 1,
            color: Colors.black,
          ),
          borderRadius: BorderRadius.circular(10),
          color: const Color(0xf5f5f5),
        ),
        child: Row(
          children: [
            CircleAvatar(
              radius: 40, // Image radius
              backgroundImage: const NetworkImage(
                  'https://cdn.vectorstock.com/i/1000x1000/96/75/summer-icon-sunny-bright-circle-shape-sun-shine-vector-25599675.webp'),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 10.0),
              child: Column(
                children: [
                  SizedBox(height: 10.0),
                  Text(
                    "Vellore, India",
                    style: TextStyle(fontSize: 15),
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    "25 °",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Text('Today, 22 Jan'),
          ],
        ),
      ),
    );
  }
}
