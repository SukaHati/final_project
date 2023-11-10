import 'dart:convert';

import 'package:final_project/widgets/review.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


import '../models/place_detail.dart';

class DetailPage extends StatefulWidget {
  final int id;
  DetailPage({required this.id});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  PlaceDetail? _hotel;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  void loadData() {
    fetchPlace().then((value) {
      setState(() {
        _hotel = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail Page"),
      ),
      body: _hotel == null?Center(child: CircularProgressIndicator()):SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Image.network(
                "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/03/23/80/a6/hotel-sovereign.jpg?w=1200&h=-1&s=1"),
            Text(_hotel!.name),
            Text(_hotel!.address),
            Text(_hotel!.description),
            //Text(_hotel!.number),
            Text("Review"),
            ElevatedButton(onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => ReviewPage()));
            }, child: Text("Add new review")),
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: _hotel!.reviews.length,
                itemBuilder: (context, index) {
                var currentReview = _hotel!.reviews[index];
              return Card(
                child: ListTile(
                  title: Text(currentReview.comment),
                  subtitle: Text("${currentReview.nameReviewer} - ${currentReview.rating}"),
                ),
              );
            })
          ],
        ),
      ),
    );
  }


  Future<PlaceDetail> fetchPlace() async {
    String thelink = "https://api-mobile-hotel.onrender.com/api/places/${widget.id}"; //Kalau stateful, kena tambah widget

    final response = await http
        .get(Uri.parse(thelink));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      //Jika saya memanipulasi [], panggil method ke-5
      //Jika saya memanipulasi {}, panggil method ke-4
      return PlaceDetail.fromJson(jsonDecode(response.body)["data"]);
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }
}