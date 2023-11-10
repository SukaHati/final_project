import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:custom_rating_bar/custom_rating_bar.dart';
import 'package:http/http.dart' as http;

class ReviewPage extends StatefulWidget {
  //final int placeId;
  //ReviewPage({required this.placeId});

  @override
  State<ReviewPage> createState() => _ReviewPageState();
}

class _ReviewPageState extends State<ReviewPage> {
  final ratingEditingController = TextEditingController();
  final reviewEditingController = TextEditingController();
  double _rating = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Review Page")
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            RatingBar(
              filledIcon: Icons.star,
              emptyIcon: Icons.star_border,
              onRatingChanged: (value) => setState((){
                _rating = value;
              }),
              initialRating: _rating,
              maxRating: 5,
            ),
            TextField(decoration: InputDecoration(hintText: "Write your review here"), controller: reviewEditingController,),
            SizedBox(height: 8,),
            ElevatedButton(onPressed: () {
              createReview(reviewEditingController.text, _rating.round(), 1).then((value) {
                if(value.statusCode == 200) {
                  Navigator.pop(context);
                }
                else {
                  print("Something is wrong");
                }
              });
            }, child: Text("Add new review"))
          ],
        ),
      ),
    );
  }
  Future<http.Response> createReview(String review, int rating, int placeId) {
    return http.post(
      Uri.parse('https://api-mobile-hotel.onrender.com/api/places/$placeId/reviews'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'comment': review,
        'rating': rating,
        'user_id': 1
      }),
    );
  }
}
