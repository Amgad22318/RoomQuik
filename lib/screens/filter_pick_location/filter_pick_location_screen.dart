import 'package:algoriza_team_6_realestate_app/business_logic/cubit/filter_cubit/filter_cubit.dart';
import 'package:algoriza_team_6_realestate_app/constants/constant_methods.dart';
import 'package:algoriza_team_6_realestate_app/constants/constants.dart';
import 'package:algoriza_team_6_realestate_app/styles/colors.dart';
import 'package:algoriza_team_6_realestate_app/widgets/default_icon_button.dart';
import 'package:algoriza_team_6_realestate_app/widgets/default_map.dart';
import 'package:algoriza_team_6_realestate_app/widgets/search_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart'; // import 'package:google_maps_webservice/places.dart';
// import 'package:google_api_headers/google_api_headers.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sizer/sizer.dart';

import '../../data/di/di.dart';

class FilterPickLocationScreen extends StatefulWidget {
  final int distance;

  const FilterPickLocationScreen({Key? key, required this.distance})
      : super(key: key);

  @override
  State<FilterPickLocationScreen> createState() =>
      _FilterPickLocationScreenState();
}

class _FilterPickLocationScreenState extends State<FilterPickLocationScreen> {
  Set<Marker> markersList = {};

  late GoogleMapController googleMapController;
  final homeScaffoldKey = GlobalKey<ScaffoldState>();
  late FilterCubit filterCubit;

  @override
  void initState() {
    filterCubit = sl<FilterCubit>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: homeScaffoldKey,
        body: SafeArea(
          child: BlocBuilder<FilterCubit, FilterState>(
            builder: (context, state) {
              return Stack(
                children: [
                  DefaultMap(
                    myLocationButtonEnabled: false,
                    onMapCreated: (controller) {
                      googleMapController = controller;
                    },
                    initialCameraPosition: appInitialCameraPosition,
                    onTap: (newLocation) {
                      filterCubit.pickNewLocation(newLocation);
                    },
                    markers: filterCubit.locationPicked != null
                        ? {
                            Marker(
                                markerId: const MarkerId('picked Location'),
                                position: filterCubit.locationPicked!)
                          }
                        : {},
                    circles: filterCubit.locationPicked != null
                        ? {
                            Circle(
                                fillColor: Colors.blue.withOpacity(0.3),
                                circleId:
                                    const CircleId('picked Location Distance'),
                                center: filterCubit.locationPicked!,
                                radius: widget.distance * 1000,
                                strokeWidth: 2,
                                strokeColor: Colors.blue)
                          }
                        : {},
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 3.w)
                        .copyWith(top: 2.h),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 25,
                          child: SearchFormField(
                            hintText: 'Address',
                            controller: filterCubit.searchLocationController,
                            keyboardType: TextInputType.text,
                            backgroundColor: defaultAppColor3,
                            onFieldSubmitted: (text) async {
                              List<Location> locations =
                                  await locationFromAddress(text,
                                      localeIdentifier: 'en');
                              filterCubit.pickNewLocation(LatLng(
                                  locations.first.latitude,
                                  locations.first.longitude));
                              googleMapController.animateCamera(
                                  CameraUpdate.newCameraPosition(CameraPosition(
                                      target: filterCubit.locationPicked!,
                                      zoom: 9)));
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
                            if (filterCubit.locationPicked != null) {
                              Navigator.pop(context);
                            } else {
                              showToastMsg(
                                  msg: 'Please pick location',
                                  toastState: ToastStates.error);
                            }
                          },
                          icon: const Icon(Icons.check),
                        ),
                        const Spacer(),
                        DefaultIconButton(
                          iconSize: 18.sp,
                          iconColor: defaultAppColor2,
                          radius: 25.sp,
                          background: defaultAppColor3,
                          onPressed: () {
                            filterCubit.searchLocationController.clear();
                            filterCubit.pickNewLocation(null);
                          },
                          icon: const Icon(Icons.wrong_location_outlined),
                        )
                      ],
                    ),
                  )
                ],
              );
            },
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
