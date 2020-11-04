import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:clima/services/location.dart';
import 'package:http/http.dart' as Http;
import 'dart:convert';
import 'package:clima/utilities/constants.dart';
import '../services/weather.dart';
import '../services/weather.dart';
import 'location_screen.dart';
import '../services/networking.dart';
import '../services/networking.dart';
import '../utilities/constants.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:clima/services/weather.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
// String url = 'https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=$apiKey';
  void getLocationData() async {
    WeatherModel weatherModel = WeatherModel();
    var weatherData = await weatherModel.getLocationData();
    // var weatherData2 = await WeatherModel().getLocationData();

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen(
        locationWeather: weatherData,
      );
    }));
  }

  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: SpinKitWave(
        color: Colors.teal,
        size: 50.0,
      )

          // RaisedButton(
          //   onPressed: () {
          //     //Get the current location
          //     // getLocation();
          //     // getData();
          //   },
          //   child: Text('Get Location'),
          // ),
          ),
    );
  }
}
