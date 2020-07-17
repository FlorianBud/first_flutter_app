import 'package:flutter/material.dart';
import 'package:http/http.dart';

class JsonParsingSimple extends StatefulWidget {
  @override
  _JsonParsingSimpleState createState() => _JsonParsingSimpleState();
}

class _JsonParsingSimpleState extends State<JsonParsingSimple> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Parsing JSON"),
      ),
    );
  }
}

class Network {
  final String url;

  Network(this.url);

  Future fetchData() async {
    print("url");
    Response response = await get(Uri.encodeFull(url));

    if (response.statusCode == 200) {
      //ok
      print(response.body);
      return response.body;
    } else {
      print(response.statusCode)
    }
  }


}



