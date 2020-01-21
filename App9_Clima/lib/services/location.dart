import 'package:geolocator/geolocator.dart';

class Location {
  Future<Position> getLocation() async {
    Position position = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
    return position;
  }
}
