import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../constants/constants.dart';
import '../../../data/source/local/my_shared_preferences.dart';
import '../../../data/source/local/my_shared_preferences_keys.dart';
import '../../constants/screens.dart';
import '../../data/di/di.dart';
import '../../styles/colors.dart';
import '../../widgets/default_rich_text.dart';
import '../../widgets/default_text_span.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    )..forward();
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    );

    Timer(const Duration(milliseconds: 2500), () async {
      if(sl<MySharedPref>().getString(key: MySharedKeys.apiToken).isNotEmpty) {
        Navigator.of(context)
          .pushNamedAndRemoveUntil(appLayoutRoute, (route) => false);
      }else{
        Navigator.of(context)
            .pushNamedAndRemoveUntil(onBoardingRoute, (route) => false);
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: defaultDarkBlue,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: FadeTransition(
                  opacity: _animation,
                  child: Icon(
                    Icons.home_work_rounded,
                    size: 75.sp,
                    color: defaultAppColor,
                  )),
            ),
            Flexible(
                child: DefaultRichText(
                    text: defaultTextSpan(children: [
              defaultTextSpan(text: 'R', color: defaultAppColor2),
              defaultTextSpan(text: 'oom', color: defaultAppColor),
              defaultTextSpan(text: 'Q', color: defaultAppColor2),
              defaultTextSpan(text: 'uik', color: defaultAppColor),
            ]))),
          ],
        ),
      ),
    );
  }
}
