import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class Location {
  double latitude;
  double longitude;

  Future getCurrentLocation() async {
    try {
      Position position = await getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low); //battery related
      //wait to found locations before return it to longitude

      latitude = position.latitude;
      longitude = position.longitude;
      print("Posicion es, latitude: $latitude, longitud: $longitude");
    } catch (e) {
      print(e);
    }
  }
}

/*

    var longitude = decodeData['coord']['lon']; //exactly as the json
    var latitude = decodeData['coord']['lat']; //exactly as the json
    var weather =
        decodeData['weather'][0]['main']; //to access a list element is by index
    var weatherDescription = decodeData['weather'][0]
        ['description']; //to access a list element is by index
    var city = decodeData['name'];
    var temperature = decodeData['main']['temp'];

    print(longitude);
    print(latitude);
    print(weather);
    print(weatherDescription);
    print(city);
    print(temperature);
* */
