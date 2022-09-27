import 'package:google_maps_flutter/google_maps_flutter.dart';

class PickedLocationArgs {
  final LatLng? pickedLocationLatLng;
  final String? pickedLocationAddress;

  PickedLocationArgs({this.pickedLocationLatLng, this.pickedLocationAddress});
}
