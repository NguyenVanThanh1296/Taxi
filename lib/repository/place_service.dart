import '../config/config.dart';
import '../model/place_model.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class PlaceService {
  static Future<List<PlaceItemRes>> searchPlace(String keyWord) async {
    String url =
        "https://maps.googleapis.com/maps/api/place/textsearch/json?key=${Configs.ggKey2}&language=vi&region=VN&query${Uri.encodeQueryComponent(keyWord)}";

    print("search >> $url");
    var res = await http.get(Uri.parse(url));
    if (res.statusCode == 200) {
      return PlaceItemRes.fromJson(json.decode(res.body));
    } else {
      return [];
    }
  }
}
