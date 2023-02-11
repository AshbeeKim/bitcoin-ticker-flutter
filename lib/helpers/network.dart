import 'dart:convert';
import 'package:http/http.dart' as http;

class NetworkHelper {
  NetworkHelper(this.url);

  final String url;

  Future getData({Map<String, String>? customHeader}) async {
    http.Response response = customHeader != null
      ? await http.get(Uri.parse(url), headers: customHeader)
      : await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      var data = response.body;
      return jsonDecode(data);
    } else {
      print(response.statusCode);
      throw 'Error cause from the get request';
    }
  }
}