import 'package:clima/screens/location_screen.dart';
import 'package:clima/services/weather.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    getLocationData();
    super.initState();
  }

  void getLocationData() async {
    setState(() async {
      final weatherModel = WeatherModel();
      final weatherFuture = await weatherModel.getWeatherByLocation();
      await Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => LocationScreen(
                    locationWeather: weatherFuture,
                  )));
    });
  }

  @override
  Widget build(BuildContext context) {
    const spinkit = SpinKitRotatingCircle(
      color: Colors.white,
      size: 50.0,
    );

    return spinkit;
  }
}
