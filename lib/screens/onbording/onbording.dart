
import 'package:algoriza_team_6_realestate_app/constants/screens.dart';
import 'package:algoriza_team_6_realestate_app/widgets/default_material_button.dart';
import 'package:algoriza_team_6_realestate_app/widgets/onbording_page.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../styles/colors.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({Key? key, }) : super(key: key);
  @override
  State<Onboarding> createState() => _OnboardingState();
}
class _OnboardingState extends State<Onboarding> {
  final controller = PageController();
  final carouselcontroller = CarouselController();
   List<Widget> aa = [
     const OnboardingPage(
         imagepath: '1.png',
         boldText: 'plan your traps',
         smallText: 'book one of your unique hotel to escape the ordinary'
     ),
     const OnboardingPage(
         imagepath: '2.png',
         boldText: 'plan your traps',
         smallText: 'book one of your unique hotel to escape the ordinary'
     ),
     const OnboardingPage(
         imagepath: '3.png',
         boldText: 'plan your traps',
         smallText: 'book one of your unique hotel to escape the ordinary'
     ),
   ];
    int fullProductCarouselSliderImagesActiveIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: defaultLightBlack,
        body: CarouselSlider(
           carouselController: carouselcontroller,
          options: CarouselOptions(
            initialPage: 0,
            onPageChanged: (index ,reason)
              {
                setState(() {
                  fullProductCarouselSliderImagesActiveIndex =
                      index;
                });
              },
            autoPlay: true,
            viewportFraction: 1,
            height: double.infinity,
          ),
          items: aa,
        ),
        bottomSheet: Container(
          color: defaultLightBlack,
          height: 200,
          width: double.infinity,
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              AnimatedSmoothIndicator(
                count: aa.length,
                effect:  const WormEffect(
                  spacing:  5.0,
                  radius:  5.0,
                  dotWidth:  10.0,
                  dotHeight:  10.0,
                  strokeWidth:  0,
                  dotColor:  defaultGray,
                  activeDotColor: defaultAppColor,
                ), activeIndex: fullProductCarouselSliderImagesActiveIndex,
              ),
              Padding(
                padding: const EdgeInsets.all(22),
                child: DefaultMaterialButton(
                  onPressed: (){
                    Navigator.pushNamed(context, loginRoute);
                  },
                  height: 55,
                  background: defaultLightTealColor,
                  text: 'Login',
                  fontSize: 18,

                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  right: 22,
                  left: 22,
                ),
                child: DefaultMaterialButton(
                  onPressed: (){
                    Navigator.pushNamed(context, signupRoute);

                  },
                  height: 55,
                  text: 'Create account',
                  fontSize: 18,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

