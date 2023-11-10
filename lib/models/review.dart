class Review {
  final String comment;
  final int rating;
  final String nameReviewer;
  final int id;

  Review({required this.comment, required this.rating, required this.nameReviewer, required this.id});

  factory Review.fromJson(Map<String, dynamic> json) {
    return Review(comment: json["comment"], rating: json["rating"], nameReviewer: "Hasif", id: json["id"]);
  }
  static List<Review> reviewsFromJson(dynamic json ){
    var searchResult = json;
    List<Review> results = List.empty(growable: true);

    if (searchResult != null){

      searchResult.forEach((v)=>{
        results.add(Review.fromJson(v))
      });
      return results;
    }
    return results;
  }
}