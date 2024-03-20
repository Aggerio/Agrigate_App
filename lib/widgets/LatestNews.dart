import 'package:flutter/material.dart';

class LatestNewsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10.0),
      width: 120,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          width: 1,
          color: Colors.grey,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            'assets/tomato.jpg',
            width: 90,
            height: 80,
          ),
          const Text(
            'Alt News',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          const Text(
            "Some Random News Lorem Ipsum",
          ),
        ],
      ),
    );
  }
}

class LatestNews extends StatelessWidget {
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
                "Latest News",
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              InkWell(
                onTap: () => Navigator.of(context).pushNamed('/latest_news'),
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
            children: [
              const SizedBox(width: 10.0),
              LatestNewsWidget(),
              const SizedBox(width: 10.0),
              LatestNewsWidget(),
              const SizedBox(width: 10.0),
              LatestNewsWidget(),
              const SizedBox(width: 10.0),
              LatestNewsWidget(),
            ],
          ),
        )
      ],
    );
  }
}

