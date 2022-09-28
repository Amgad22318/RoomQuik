import 'package:algoriza_team_6_realestate_app/constants/constant_methods.dart';
import 'package:algoriza_team_6_realestate_app/constants/screens.dart';
import 'package:algoriza_team_6_realestate_app/widgets/default_material_button.dart';
import 'package:algoriza_team_6_realestate_app/widgets/onbording_page.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../styles/colors.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({
    Key? key,
  }) : super(key: key);
  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  final carouselController = CarouselController();
  List<Widget> pagesList = [
    const OnBoardingPage(
        imagePath: 'assets/image/onboarding_1.png',
        boldText: 'plan your trips',
        smallText: 'book one of your unique hotel to escape the ordinary'),
    const OnBoardingPage(
        imagePath: 'assets/image/onboarding_2.png',
        boldText: 'plan your trips',
        smallText: 'book one of your unique hotel to escape the ordinary'),
    const OnBoardingPage(
        imagePath: 'assets/image/onboarding_3.png',
        boldText: 'plan your trips',
        smallText: 'book one of your unique hotel to escape the ordinary'),
  ];
  late int activeIndex;

  @override
  void initState() {
    activeIndex = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: CarouselSlider(
                carouselController: carouselController,
                options: CarouselOptions(
                  enlargeCenterPage: true,
                  height: 60.h,
                  initialPage: 0,
                  onPageChanged: (index, reason) {
                    setState(() {
                      activeIndex = index;
                    });
                  },
                  autoPlay: true,
                  viewportFraction: 1,
                ),
                items: pagesList,
              ),
            ),
            AnimatedSmoothIndicator(
              count: pagesList.length,
              effect: WormEffect(
                spacing: 5.0,
                radius: 5.0,
                dotWidth: 10.0,
                dotHeight: 10.0,
                strokeWidth: 0,
                dotColor: defaultGray,
                activeDotColor:
                    darkOrLightColor(defaultAppColor4, defaultAppColor),
              ),
              activeIndex: activeIndex,
            ),
            Padding(
              padding: const EdgeInsets.all(22),
              child: DefaultMaterialButton(
                onPressed: () {
                  Navigator.pushNamed(context, loginRoute);
                },
                background: darkOrLightColor(defaultAppColor4, defaultAppColor),
                text: 'Login',
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 22, left: 22, bottom: 5.h),
              child: DefaultMaterialButton(
                onPressed: () {
                  Navigator.pushNamed(context, signupRoute);
                },
                text: 'Create account',
              ),
            )
          ],
        ),
      ),
    );
  }
}
