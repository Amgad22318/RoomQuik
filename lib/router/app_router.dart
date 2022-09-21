import 'package:algoriza_team_6_realestate_app/constants/screens.dart'
    as screens;
import 'package:algoriza_team_6_realestate_app/screens/app_layout/app_layout.dart';
import 'package:algoriza_team_6_realestate_app/screens/auth_pages/sign_up_screen.dart';
import 'package:algoriza_team_6_realestate_app/screens/filter/filter_sceen.dart';
import 'package:algoriza_team_6_realestate_app/screens/setting/setting_screen.dart';
import 'package:flutter/material.dart';


import '../screens/my_profile/change_password.dart';
import '../screens/my_profile/edit_profile.dart';

import '../screens/auth_pages/login_screen.dart';
import '../screens/onbording/onbording.dart';

import '../screens/splash/splash_screen.dart';

class AppRouter {
  late Widget startScreen;

  Route? onGenerateRoute(RouteSettings settings) {
    startScreen = const SplashScreen();

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => startScreen);
      case screens.settingScreenRoute:
        return MaterialPageRoute(builder: (_) => SettingScreen());
        case screens.onboardingRoute:
        return MaterialPageRoute(builder: (_) => const Onboarding());
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
        return MaterialPageRoute(builder: (_) => FilterScreen());
      case screens.UpdateProfileRoute:
        return MaterialPageRoute(builder: (_) => EditProfile());
      case screens.ChangePasswordRoute:
        return MaterialPageRoute(builder: (_) => ChangePassword());

      default:
        return null;
    }
  }
}
