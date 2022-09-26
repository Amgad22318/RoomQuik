import 'package:google_maps_flutter/google_maps_flutter.dart';

CameraPosition appInitialCameraPosition = const CameraPosition(
  target: LatLng(26.8206, 30.8025),
  zoom: 5,
);

enum ToastStates { SUCCESS, ERROR, WARNING }

enum BookingStatus { upcomming, cancelled, completed }

String httpSC = 'http:';
String imageBaseURL = 'http://api.mahmoudtaha.com/images/';
