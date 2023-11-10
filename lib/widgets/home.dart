import 'dart:convert';

import 'package:final_project/widgets/detail.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/place_list.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List<PlaceList> _places = [
  ];

  //Init state
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }
  void loadData() {
    fetchPlaces().then((value) {
    if (mounted) {
      setState(() {
        _places = value;
      });
    }
    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
      ),
      body: ListView.builder(
        itemCount: _places.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(_places[index].name),
            subtitle: Text(_places[index].address),
            leading: Image.network(_places[index].image_url),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => DetailPage(id: _places[index].id)));
            },
          );
        },
      )
    );
  }
}

Future<List<PlaceList>> fetchPlaces() async {
  String thelink = "https://api-mobile-hotel.onrender.com/api/places";

  final response = await http
      .get(Uri.parse(thelink));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    //Jika saya memanipulasi [], panggil method ke-5
    //Jika saya memanipulasi {}, panggil method ke-4
    return PlaceList.placesFromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}
