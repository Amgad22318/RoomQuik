import 'package:algoriza_team_6_realestate_app/constants/screens.dart'
    as screens;
import 'package:algoriza_team_6_realestate_app/screens/app_layout/app_layout.dart';
import 'package:algoriza_team_6_realestate_app/screens/auth_pages/login_screen.dart';
import 'package:algoriza_team_6_realestate_app/screens/auth_pages/sign_up_screen.dart';
import 'package:algoriza_team_6_realestate_app/screens/filter/filter_sceen.dart';
import 'package:algoriza_team_6_realestate_app/screens/filter_pick_location/filter_pick_location_screen.dart';
import 'package:algoriza_team_6_realestate_app/screens/filter_result/filter_result_screen.dart';
import 'package:algoriza_team_6_realestate_app/screens/filter_result_location/filter_result_location_screen.dart';
import 'package:algoriza_team_6_realestate_app/screens/hotel_location/hotel_location.dart';
import 'package:algoriza_team_6_realestate_app/screens/onbording/onbording.dart';
import 'package:algoriza_team_6_realestate_app/screens/setting/setting_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../data/models/base/hotel/hotel_data.dart';
import '../data/models/responses/auth_model/auth_model.dart';
import '../data/models/responses/hotels_model/hotels_model.dart';
import '../screens/hotel_details/hotel_details.dart';
import '../screens/my_profile/change_password.dart';
import '../screens/my_profile/edit_profile.dart';
import '../screens/splash/splash_screen.dart';
import 'custom_page_route.dart';

class AppRouter {
  late Widget startScreen;

  Route? onGenerateRoute(RouteSettings settings) {
    startScreen = const SplashScreen();

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => startScreen);
      case screens.settingRoute:
        return CustomPageRoute(
            direction: AxisDirection.left, child: SettingScreen());
      case screens.onBoardingRoute:
        return MaterialPageRoute(builder: (_) => const OnBoarding());
      case screens.loginRoute:
        return CustomPageRoute(
            direction: AxisDirection.down, child: const Login());
      case screens.signupRoute:
        return CustomPageRoute(
            direction: AxisDirection.down, child: const SignUp());

      case screens.appLayoutRoute:
        int? route = settings.arguments as int?;
        return MaterialPageRoute(
            builder: (_) => AppLayout(
                  route: route,
                ));
      case screens.filterScreenRoute:
        String searchText = settings.arguments as String;
        return CustomPageRoute(
            direction: AxisDirection.down,
            child: FilterScreen(searchText: searchText));
      case screens.updateProfileRoute:
        return CustomPageRoute(
            direction: AxisDirection.left, child: const EditProfile());
      case screens.changePasswordRoute:
        Auth auth = settings.arguments as Auth;
        return CustomPageRoute(
            direction: AxisDirection.left,
            child: ChangePassword(
              myProfile: auth,
            ));
      case screens.hotelDetailsRoute:
        HotelData hotelData = settings.arguments as HotelData;
        return CustomPageRoute(
            child: HotelDetails(
          hotelData: hotelData,
        ));

      case screens.hotelLocationRoute:
        LatLng latLng = settings.arguments as LatLng;
        return CustomPageRoute(
          direction: AxisDirection.right,
          child: HotelLocation(latLng: latLng),
        );
      case screens.filterResultRoute:
        Hotels filterHotels = settings.arguments as Hotels;
        return CustomPageRoute(
          child: FilterResultScreen(filterHotels: filterHotels),
        );
      case screens.filterResultLocationRoute:
        Hotels filterHotels = settings.arguments as Hotels;
        return CustomPageRoute(
          direction: AxisDirection.up,
          child: FilterResultLocationScreen(filterHotels: filterHotels),
        );
      case screens.filterPickLocationRoute:
        int distance = settings.arguments as int;

        return CustomPageRoute(
            direction: AxisDirection.left,
            child: FilterPickLocationScreen(
              distance: distance,
            ));

      default:
        return null;
    }
  }
}
