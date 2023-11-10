class PlaceList {
  final int id;
  final String name;
  final String address;
  final String image_url;

  PlaceList({required this.id, required this.name, required this.address, required this.image_url});

  factory PlaceList.fromJson(Map<String, dynamic> json){
    return PlaceList(id: json["id"], name: json["name"], address: json["address"], image_url: json["image_url"]);
  }

  //Step5. Array of json to list of object transformer
  static List<PlaceList> placesFromJson(dynamic json ){
    var searchResult = json["data"];
    List<PlaceList> results = List.empty(growable: true);

    if (searchResult != null){

      searchResult.forEach((v)=>{
        results.add(PlaceList.fromJson(v))
      });
      return results;
    }
    return results;
  }
}