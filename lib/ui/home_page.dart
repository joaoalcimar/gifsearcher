import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String? _search;
  String urlTrending =
      "https://api.giphy.com/v1/gifs/trending?api_key=dZ5jcMVgDn0F3e9lIu2fRfltbY4F3qs4&limit=20&rating=g";

  int _offset = 0;

  Future _getGifs() async {
    http.Response response;

    if (_search == null) {
      response = await http.get(urlTrending);
    } else {
      response = await http.get(
          "https://api.giphy.com/v1/gifs/search?api_key=dZ5jcMVgDn0F3e9lIu2fRfltbY4F3qs4&q=$_search&limit=20&offset=$_offset&rating=g&lang=en");
    }

    return json.decode(response.body);
  }

  @override
  void initState() {
    super.initState();

    _getGifs().then((map) {
      print(map);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Image.network(
            "https://developers.giphy.com/static/img/dev-logo-lg.gif"),
        centerTitle: true,
      ),
      backgroundColor: Colors.black,
      body: Column(
        children: <Widget>[
          Padding(
              padding: EdgeInsets.all(10.0),
              child: TextField(
                decoration: InputDecoration(
                    labelText: "Pesquise Aqui",
                    labelStyle: TextStyle(color: Colors.white),
                    border: OutlineInputBorder()),
                style: TextStyle(color: Colors.white, fontSize: 18.0),
                textAlign: TextAlign.center,
              ))
        ],
      ),
    );
  }
}
