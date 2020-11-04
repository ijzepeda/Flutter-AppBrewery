import 'package:flutter/material.dart';
import 'package:clima/utilities/constants.dart';
import 'package:clima/services/weather.dart';

import '../services/weather.dart';
import '../services/weather.dart';
import 'package:clima/screens/city_screen.dart';

import 'city_screen.dart';
import 'city_screen.dart';

class LocationScreen extends StatefulWidget {
  final locationWeather;

  LocationScreen({this.locationWeather});

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

//clase interna con el estado. se llama de la anterior. la anterior es contactada por otrs servicios, y en esta clase se crean metodos y demas

class _LocationScreenState extends State<LocationScreen> {
  String city;
  double temp;
  int temperature;
  int weatherCondition;
  String weatherDescription;
  WeatherModel weatherModel = WeatherModel();

  String weatherIcon;
  String message;

  @override
  void initState() {
    super.initState();
    //at initstate the arg from the constructor is accesible. from a variable called widget (something like the bundle in android)
    //I should use widget, and call its element(from argument) locationWeather
    //widget.locationweather

    updateUI(widget.locationWeather);
  }

  void updateUI(dynamic weatherData) {
    //as happening in UI is better to do a setState, and place all variables here, instead of within the code
    setState(() {
      if (weatherData == null) {
        temp = 0;
        temperature = 0;
        message = "Unable to get weather Data";
        weatherIcon = "Error";
        city = "nowhere";
        return;
      } else {
        city = weatherData['name'];
        temp = weatherData['main']['temp']; //is in KELVIN!
        temperature = temp.toInt();
        weatherCondition = weatherData['weather'][0]['id'];
        weatherDescription = weatherData['weather'][0]
            ['description']; //to access a list element is by index
        weatherIcon = weatherModel.getWeatherIcon(weatherCondition);
        message = weatherModel.getMessage(temperature);
        print(temperature);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/location_background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  FlatButton(
                    onPressed: () async {
                      var weatherData = await weatherModel.getLocationData();
                      updateUI(weatherData);
                    },
                    child: Icon(
                      Icons.near_me,
                      size: 50.0,
                    ),
                  ),
                  FlatButton(
                    onPressed: () async {
                      var returnedValue = await Navigator.push(
                        context,
                        //la funcion puede recibir un future
                        MaterialPageRoute(
                          builder: (context) {
                            return CityScreen();
                          },
                        ),
                      );
                      if (returnedValue != null) {
                        print(returnedValue);
                        var weatherData =
                            await weatherModel.getCityWeather(returnedValue);
                        updateUI(weatherData);
                      }
                    },
                    child: Icon(
                      Icons.location_city,
                      size: 50.0,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      '$temperature ˚',
                      style: kTempTextStyle,
                    ),
                    Text(
                      weatherIcon,
                      style: kConditionTextStyle,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: Text(
                  "$message in $city",
                  textAlign: TextAlign.right,
                  style: kMessageTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
