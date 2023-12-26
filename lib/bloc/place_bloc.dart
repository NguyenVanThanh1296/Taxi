import 'dart:async';
import 'package:taxi/repository/place_service.dart';

class PlaceBloc {
  final _placeController = StreamController();

  Stream get placeStream => _placeController.stream;

  void searchPlace(String keyWord) {
    print('Place bloc search$keyWord');
    _placeController.sink.add('start');
    PlaceService.searchPlace(keyWord).then((value) {
      _placeController.sink.add(value);
    }).catchError(() {
      //TODO
    });
  }

  void dispose() {
    _placeController.close();
  }
}
