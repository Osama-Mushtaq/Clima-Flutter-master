import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper{
  final String url;
  NetworkHelper(this.url);
  Future getDataurl()async{
    http.Response resp = await http.get(
      Uri.parse(url),
    );
    if (resp.statusCode == 200) {
      String data = resp.body;
      return data;
    }
    else{
      print(resp.statusCode);
    }
  }
}