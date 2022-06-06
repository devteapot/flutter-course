import 'dart:convert';

import 'package:http/http.dart' as http;

class NetworkHelper {
  final Uri uri;

  NetworkHelper(this.uri);

  Future getData() async {
    final res = await http.get(uri);

    if (res.statusCode == 200) {
      return jsonDecode(res.body);
    } else {
      print(res.body);
    }
  }
}
