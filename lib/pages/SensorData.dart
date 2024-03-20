import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class SensorData extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SensorData();
}

class _SensorData extends State<SensorData> {
  Map<String, dynamic> sensorData = {
    "NITROGEN": "50",
    "HUMIDITY": "60",
    "POTASSIUM": "70",
    "PHOSPHORUS": "55"
  };
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  Future<void> _fetchSensorData() async {
    // Replace 'https://your-server.com/api/sensor-data' with your actual server URL
    final response =
        await http.get(Uri.parse('http://192.168.237.219/sensor'));

    if (response.statusCode == 200) {
      setState(() {
        sensorData = jsonDecode(response.body);
      });
    } else {
      // Handle error case
      print('Failed to fetch sensor data: ${response.statusCode}');
    }
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      _fetchSensorData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Text(
              "Sensor Data ",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20.0),
            Container(
              width: MediaQuery.of(context).size.width * 1,
              height: MediaQuery.of(context).size.height * 0.3,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                color:
                    Colors.grey.withOpacity(0.1), // Container background color
                borderRadius:
                    BorderRadius.circular(10.0), // Rounded border radius
              ),
              padding: EdgeInsets.only(left: 20.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(200),
                      child: Image.network(
                        'https://static.vecteezy.com/system/resources/previews/024/865/644/non_2x/wheat-with-ai-generated-free-png.png',
                        fit: BoxFit.cover,
                        width: 120,
                        height: 120,
                      ),
                    ),
                    const SizedBox(
                      width: 35.0,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 10.0,
                        ),
                        const Text(
                          "Wheat",
                          style: TextStyle(
                              fontWeight: FontWeight.w300,
                              fontSize: 30,
                              color: Colors.blue),
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          "Moisture: ${sensorData['HUMIDITY']}%",
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w400),
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          "Nitrogen: ${sensorData['NITROGEN']}%",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w400),
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          "Phosphorus: ${sensorData['PHOSPHORUS']}%",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w400),
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          "Potassium: ${sensorData['POTASSIUM']}%",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
