import 'package:http/http.dart' as Http;
import 'dart:convert';

class NetworkHelper {
  String url;
  NetworkHelper({this.url});

  Future<dynamic> getData() async {
    try {
      Http.Response response = await Http.get(url);
      if (response.statusCode == 200) {
        var jsonResponse = jsonDecode(response.body);
        return jsonResponse;
      } else {
        print("Failed to get access ${response.statusCode}");
      }
    } catch (e) {
      print(e);
    }
  }
}
