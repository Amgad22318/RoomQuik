import 'package:algoriza_team_6_realestate_app/constants/constant_methods.dart';
import 'package:algoriza_team_6_realestate_app/constants/constants.dart';
import 'package:algoriza_team_6_realestate_app/data/models/arguments/picked_location_args.dart';
import 'package:algoriza_team_6_realestate_app/styles/colors.dart';
import 'package:algoriza_team_6_realestate_app/widgets/default_icon_button.dart';
import 'package:algoriza_team_6_realestate_app/widgets/default_map.dart';
import 'package:algoriza_team_6_realestate_app/widgets/search_form_field.dart';
import 'package:flutter/material.dart';

// import 'package:google_maps_webservice/places.dart';
// import 'package:google_api_headers/google_api_headers.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sizer/sizer.dart';

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
  Set<Marker> markersList = {};

  late GoogleMapController googleMapController;
  final homeScaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: homeScaffoldKey,
        body: SafeArea(
          child: Stack(
            children: [
              DefaultMap(
                onMapCreated: (controller) {
                  googleMapController = controller;
                },
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
                            circleId:
                                const CircleId('picked Location Distance'),
                            center: locationPicked!,
                            radius: widget.distance * 1000,
                            strokeWidth: 2,
                            strokeColor: Colors.blue)
                      }
                    : {},
              ),
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: 3.w).copyWith(top: 2.h),
                child: Row(
                  children: [
                    Expanded(
                      flex: 25,
                      child: SearchFormField(
                        hintText: 'Address',
                        controller: searchController,
                        keyboardType: TextInputType.text,
                        backgroundColor: defaultAppColor3,
                        onFieldSubmitted: (text) async {
                          List<Location> locations = await locationFromAddress(
                              text,
                              localeIdentifier: 'en');
                          setState(() {
                            locationPicked = LatLng(locations.first.latitude,
                                locations.first.longitude);
                            googleMapController.animateCamera(
                                CameraUpdate.newCameraPosition(CameraPosition(
                                    target: locationPicked!, zoom: 9)));
                          });
                        },
                      ),
                    ),
                    const Spacer(),
                    DefaultIconButton(
                      iconSize: 18.sp,
                      iconColor: defaultAppColor2,
                      radius: 25.sp,
                      background: defaultAppColor3,
                      onPressed: () {
                        if (locationPicked != null) {
                          Navigator.pop(
                              context,
                              PickedLocationArgs(
                                  pickedLocationLatLng: locationPicked!,
                                  pickedLocationAddress:
                                      searchController.text));
                        } else {
                          showToastMsg(
                              msg: 'Please pick location',
                              toastState: ToastStates.ERROR);
                        }
                      },
                      icon: const Icon(Icons.check),
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }

// Future<void> _handlePressButton() async {
//   Prediction? p = await PlacesAutocomplete.show(
//       context: context,
//       apiKey: 'AIzaSyAlRkiozcGPNuFec9Gdvneq5rJkcT4n0Rc',
//       onError: onError,
//       mode: Mode.overlay,
//       language: 'en',
//       strictbounds: false,
//       types: [""],
//       decoration: InputDecoration(
//           hintText: 'Search',
//           focusedBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(20),
//               borderSide: BorderSide(color: Colors.white))),
//       components: [
//         Component(Component.country, "eg"),
//       ]);
//
//   displayPrediction(p!, homeScaffoldKey.currentState);
// }
//
// void onError(PlacesAutocompleteResponse response) {
//   showToastMsg(msg: response.errorMessage!, toastState: ToastStates.ERROR);
// }
//
// Future<void> displayPrediction(
//     Prediction p, ScaffoldState? currentState) async {
//   GoogleMapsPlaces places = GoogleMapsPlaces(
//       apiKey: 'AIzaSyAlRkiozcGPNuFec9Gdvneq5rJkcT4n0Rc',
//       apiHeaders: await const GoogleApiHeaders().getHeaders());
//
//   PlacesDetailsResponse detail = await places.getDetailsByPlaceId(p.placeId!);
//
//   final lat = detail.result.geometry!.location.lat;
//   final lng = detail.result.geometry!.location.lng;
//
//   markersList.clear();
//   markersList.add(Marker(
//       markerId: const MarkerId("0"),
//       position: LatLng(lat, lng),
//       infoWindow: InfoWindow(title: detail.result.name)));
//
//   setState(() {});
//
//   googleMapController
//       .animateCamera(CameraUpdate.newLatLngZoom(LatLng(lat, lng), 14.0));
// }
}
