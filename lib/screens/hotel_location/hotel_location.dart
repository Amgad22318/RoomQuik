import 'dart:typed_data';

import 'package:algoriza_team_6_realestate_app/constants/constant_methods.dart';
import 'package:algoriza_team_6_realestate_app/widgets/default_map.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HotelLocation extends StatefulWidget {
  final LatLng latLng;
//  final  List<HotelData> hotelsData;

  const HotelLocation({
    Key? key,
    required this.latLng,
  }) : super(key: key);

  @override
  State<HotelLocation> createState() => _HotelLocationState();
}

class _HotelLocationState extends State<HotelLocation> {
  late Uint8List markerIcon;
  late Set<Marker> markers = {};
  @override
  initState() {
    _createMarkerIcon();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: DefaultMap(
            initialCameraPosition: CameraPosition(
              target: widget.latLng,
              zoom: 8,
            ),
            markers: markers),
      ),
    );
  }

  void _createMarkerIcon() async {
    markerIcon = await getBytesFromAsset("assets/image/hotel_icon.png", 100);

    markers.add(
      Marker(
          icon: BitmapDescriptor.fromBytes(markerIcon),
          markerId: MarkerId(UniqueKey().toString()),
          position: widget.latLng),
    );
    setState(() {});
  }
}
