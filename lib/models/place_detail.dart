import 'package:final_project/models/review.dart';

class PlaceDetail {
  final int id;
  final String name;
  final String description;
  final String address;
  final String email;
  final String imageURL;
  final List<Review> reviews;

  PlaceDetail({required this.id, required this.name, required this.description, required this.address, required this.email, required this.imageURL, required this.reviews});

  factory PlaceDetail.fromJson(Map<String, dynamic> json) {
    print(json);
    return PlaceDetail(id: json["id"], name: json["name"], description: json["description"], address: json["address"], email: json["email"], imageURL: json["image_url"], reviews: Review.reviewsFromJson(json["reviews"]));
  }

}

