class PlaceItemRes {
  String name;
  String address;
  String lat;
  String lng;

  PlaceItemRes(this.name, this.address, this.lat, this.lng);

  static List<PlaceItemRes> fromJson(Map<String, dynamic> json) {
    print('Parse data');
    List<PlaceItemRes> rs = [];
    var results = json['result'] as List;
    for (var item in results) {
      var p = PlaceItemRes(
          item['name'],
          item['formatted_address'],
          item['geometry']['location']['lat'],
          item['geometry']['location']['lng']);
      rs.add(p);
    }
    return rs;
  }
}
