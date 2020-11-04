import 'package:http/http.dart' as Http;
import 'dart:convert';
import 'package:clima/utilities/constants.dart';

class NetworkHelper {
  NetworkHelper(this.url);
  final String url;

  Future getData() async {
    Http.Response response =
        await Http.get(url); //as it is in the future, i should cast it as await

    if (response.statusCode == 200) {
      String data = response.body;
      return jsonDecode(data);
    } else {
      print("error ${response.statusCode}");
    }
  }
}
