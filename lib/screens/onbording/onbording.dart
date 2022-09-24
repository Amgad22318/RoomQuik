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
  final controller = PageController();
  final carouselController = CarouselController();
  List<Widget> pagesList = [
    const OnBoardingPage(
        imagePath: '1.png',
        boldText: 'plan your trips',
        smallText: 'book one of your unique hotel to escape the ordinary'),
    const OnBoardingPage(
        imagePath: '2.png',
        boldText: 'plan your trips',
        smallText: 'book one of your unique hotel to escape the ordinary'),
    const OnBoardingPage(
        imagePath: '3.png',
        boldText: 'plan your trips',
        smallText: 'book one of your unique hotel to escape the ordinary'),
  ];
  int activeIndex = 0;
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
              effect: const WormEffect(
                spacing: 5.0,
                radius: 5.0,
                dotWidth: 10.0,
                dotHeight: 10.0,
                strokeWidth: 0,
                dotColor: defaultGray,
                activeDotColor: defaultAppColor,
              ),
              activeIndex: activeIndex,
            ),
            Padding(
              padding: const EdgeInsets.all(22),
              child: DefaultMaterialButton(
                onPressed: () {
                  Navigator.pushNamed(context, loginRoute);
                },
                height: 55,
                background: defaultLightTealColor,
                text: 'Login',
                fontSize: 18,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 22, left: 22, bottom: 5.h),
              child: DefaultMaterialButton(
                onPressed: () {
                  Navigator.pushNamed(context, signupRoute);
                },
                height: 55,
                text: 'Create account',
                fontSize: 18,
              ),
            )
          ],
        ),
      ),
    );
  }
}
