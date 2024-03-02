// ignore_for_file: public_member_api_docs, sort_constructors_first

class LocationModel {
  String name;
  // latlng not supported

  double lat;
  double lng;
  LocationModel({
    required this.name,
    required this.lat,
    required this.lng,
  });
}
