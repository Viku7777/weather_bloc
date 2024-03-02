// ignore_for_file: public_member_api_docs, sort_constructors_first
class TempAppEvent {}

class FatchTempEvent extends TempAppEvent {}

class ChangeTempWithLatLng extends TempAppEvent {
  double lat;
  double lng;
  ChangeTempWithLatLng({
    required this.lat,
    required this.lng,
  });
}
