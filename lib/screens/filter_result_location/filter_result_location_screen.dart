import 'dart:typed_data';

import 'package:algoriza_team_6_realestate_app/styles/colors.dart';
import 'package:algoriza_team_6_realestate_app/views/filter_result/filter_result_item.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sizer/sizer.dart';

import '../../constants/constant_methods.dart';
import '../../data/models/responses/hotels_model/hotels_model.dart';
import '../../widgets/default_map.dart';

class FilterResultLocationScreen extends StatefulWidget {
  final Hotels filterHotels;

  const FilterResultLocationScreen({Key? key, required this.filterHotels})
      : super(key: key);

  @override
  State<FilterResultLocationScreen> createState() =>
      _FilterResultLocationScreenState();
}

class _FilterResultLocationScreenState
    extends State<FilterResultLocationScreen> {
  late CameraPosition initialCameraPosition;
  final PageController pageController = PageController();

  late Uint8List markerIcon;
  late Set<Marker> markers = {};

  @override
  initState() {
    initialCameraPosition = CameraPosition(
      target: LatLng(
        double.parse(widget.filterHotels.data.data.isNotEmpty
            ? widget.filterHotels.data.data[0].latitude
            : "0.0"),
        double.parse(widget.filterHotels.data.data.isNotEmpty
            ? widget.filterHotels.data.data[0].longitude
            : "0.0"),
      ),
      zoom: 9,
    );
    _createMarkerIcon();
    super.initState();
  }

  @override
  void dispose() {
    pageController;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            DefaultMap(
                initialCameraPosition: initialCameraPosition, markers: markers),
            SizedBox(
              height: 25.h,
              child: PageView(
                controller: pageController,
                children: List.generate(
                    widget.filterHotels.data.data.length,
                    (index) => FilterResultItem(
                          hotelData: widget.filterHotels.data.data[index],
                          background: defaultAppColor3.withOpacity(0.7),
                        )),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _createMarkerIcon() async {
    markerIcon = await getBytesFromAsset("assets/image/hotel_icon.png", 100);

    markers = widget.filterHotels.data.data
        .map(
          (hotelModel) => Marker(
            icon: BitmapDescriptor.fromBytes(markerIcon),
            markerId: MarkerId(hotelModel.id.toString()),
            infoWindow: InfoWindow(
              title: hotelModel.name,
            ),
            position: LatLng(
              double.parse(hotelModel.latitude),
              double.parse(hotelModel.longitude),
            ),
          ),
        )
        .toSet();

    setState(() {});
  }
}
