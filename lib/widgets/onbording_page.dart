import 'package:algoriza_team_6_realestate_app/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'default_text.dart';

class OnboardingPage extends StatelessWidget {
  final String imagepath ;
  final String boldText ;
  final String smallText ;
  const OnboardingPage({Key? key,
    required this.imagepath,
    required this.boldText,
    required this.smallText,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(50),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children:   [
          const Spacer(flex: 2,),
          Image(
            image: AssetImage(
                'assets/$imagepath'
            ),
          ),
          const Spacer(flex: 2,),
          DefaultText(
            text: boldText,
            fontSize: 22.sp,
            fontWeight: FontWeight.bold,
            textAlign: TextAlign.center,

          ),
          const Spacer(),
          DefaultText(
            text: smallText,
            fontSize: 12.sp,
            color: defaultGray,
            textAlign: TextAlign.center,
            fontWeight: FontWeight.bold,
            overflow:TextOverflow.ellipsis,
            maxLines: 3,
          ),
          const Spacer(flex: 5,),
        ],
      ),
    );
  }
}
