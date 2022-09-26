import 'package:algoriza_team_6_realestate_app/constants/constants.dart';
import 'package:algoriza_team_6_realestate_app/styles/colors.dart';
import 'package:algoriza_team_6_realestate_app/widgets/default_map.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class FilterPickLocationScreen extends StatefulWidget {
  final int distance;
  const FilterPickLocationScreen({Key? key, required this.distance})
      : super(key: key);

  @override
  State<FilterPickLocationScreen> createState() =>
      _FilterPickLocationScreenState();
}

class _FilterPickLocationScreenState extends State<FilterPickLocationScreen> {
  LatLng? locationPicked;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: DefaultMap(
        initialCameraPosition: appInitialCameraPosition,
        onTap: (location) {
          setState(() {
            locationPicked = location;
          });
        },
        markers: locationPicked != null
            ? {
                Marker(
                    markerId: const MarkerId('picked Location'),
                    position: locationPicked!)
              }
            : {},
        circles: locationPicked != null
            ? {
                Circle(
                    fillColor: Colors.blue.withOpacity(0.3),
                    circleId: const CircleId('picked Location Distance'),
                    center: locationPicked!,
                    radius: widget.distance * 1000,
                    strokeWidth: 2,
                    strokeColor: Colors.blue)
              }
            : {},
      ),
    ));
  }
}
