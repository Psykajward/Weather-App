import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  NetworkHelper(this.url);

  final String url;

  Future<dynamic> getData() async {
    try {
      Uri uri = Uri.parse(url);
      print('Making request to: $uri');
      http.Response response = await http.get(uri).timeout(Duration(seconds: 10));

      if (response.statusCode == 200) {
        String data = response.body;
        print('Response Data: $data');
        return jsonDecode(data);
      } else {
        print('Error: ${response.statusCode}');
        print('Response Body: ${response.body}');
        return null; // Return null if an error occurs
      }
    } catch (e) {
      print('Exception during HTTP request: $e');
      return null;
    }
  }
}
