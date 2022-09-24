import 'package:algoriza_team_6_realestate_app/constants/screens.dart'
    as screens;
import 'package:algoriza_team_6_realestate_app/data/models/responses/hotels_model/hotels_model.dart';
import 'package:algoriza_team_6_realestate_app/screens/app_layout/app_layout.dart';
import 'package:algoriza_team_6_realestate_app/screens/auth_pages/login_screen.dart';
import 'package:algoriza_team_6_realestate_app/screens/auth_pages/sign_up_screen.dart';
import 'package:algoriza_team_6_realestate_app/screens/filter/filter_sceen.dart';
import 'package:algoriza_team_6_realestate_app/screens/hotel_location/hotel_location.dart';
import 'package:algoriza_team_6_realestate_app/screens/onbording/onbording.dart';
import 'package:algoriza_team_6_realestate_app/screens/setting/setting_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

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
      case screens.settingScreenRoute:
        return MaterialPageRoute(builder: (_) => SettingScreen());

      case screens.onBoardingRoute:
        return MaterialPageRoute(builder: (_) => OnBoarding());
      case screens.loginRoute:
        return MaterialPageRoute(builder: (_) => Login());
      case screens.signupRoute:
        return MaterialPageRoute(builder: (_) => SignUp());

      case screens.appLayoutRoute:
        int? route = settings.arguments as int?;
        return MaterialPageRoute(
            builder: (_) => AppLayout(
                  route: route,
                ));
      case screens.filterScreenRoute:
        String searchText = settings.arguments as String;
        return MaterialPageRoute(
            builder: (_) => FilterScreen(searchText: searchText));
      case screens.onBoardingRoute:
        return MaterialPageRoute(builder: (_) => OnBoarding());
      case screens.updateProfileRoute:
        return MaterialPageRoute(builder: (_) => EditProfile());
      case screens.changePasswordRoute:
        return MaterialPageRoute(builder: (_) => ChangePassword());
      case screens.hotelDetailsRoute:
        HotelData hotelData = settings.arguments as HotelData;
        return CustomPageRoute(
            child: HotelDetails(
          hotelData: hotelData,
        ));
      case screens.hotelLocationRoute:
        LatLng latLng = settings.arguments as LatLng;
        return MaterialPageRoute(
          builder: (_) => HotelLocation(latLng: latLng),
        );

      default:
        return null;
    }
  }
}
