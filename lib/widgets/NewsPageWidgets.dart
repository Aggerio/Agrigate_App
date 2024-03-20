import 'package:flutter/material.dart';

class LatestGovermentNews extends StatelessWidget {
  List<Widget> create_list() {
    List<Widget> outp = [];
    for (int i = 0; i < 4; ++i) {
      outp.add(
        Column(
          children: [
            SizedBox(height: 10.0),
            Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.network(
                    "https://img.etimg.com/thumb/msid-107005789,width-300,height-225,imgsize-197704,resizemode-75/union-budget-2022-sowing-seeds-of-chemical-free-farming.jpg",
                    height: 200,
                    width: 300,
                  ),
                  Text(
                    "Times of India",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Budget 2024 can sow inclusive growth for farmers & women to get a vibrant Bharat",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }
    return outp;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Text(
          "Latest Government News",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10.0),
        Container(
          width: MediaQuery.of(context).size.width,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: create_list(),
            ),
          ),
        )
      ],
    );
  }
}

class LatestNews extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Text(
            "Latest News",
            style: TextStyle(fontSize: 15),
          ),
          SizedBox(height: 10.0),
          Image.network(
            "https://t3.ftcdn.net/jpg/01/98/04/52/360_F_198045217_XX6x4ll5Ov4thdKEpS7Ebn0DEJZHuN8I.jpg",
            width: MediaQuery.of(context).size.width,
            height: 150,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [],
            ),
          ),
        ],
      ),
    );
  }
}
