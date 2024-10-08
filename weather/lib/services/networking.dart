import 'package:http/http.dart' as http;
import 'dart:convert';

class Networking {
  final String url;

  Networking({required this.url});

  Future<dynamic> fetchWeather() async {
    try {
      final http.Response response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        print('Failed to fetch data. Status code: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      print('Error occurred during HTTP request: $e');
      return null;
    }
  }
}
