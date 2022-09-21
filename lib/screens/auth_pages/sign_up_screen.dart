import 'package:algoriza_team_6_realestate_app/styles/colors.dart';
import 'package:algoriza_team_6_realestate_app/widgets/auth_form_field.dart';
import 'package:algoriza_team_6_realestate_app/widgets/default_text.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../constants/screens.dart';
import '../../widgets/default_material_button.dart';

class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsetsDirectional.only(
                start: 3.w, bottom: 3.h, end: 3.w, top: 1.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DefaultText(
                  text: 'Sign up',
                  fontSize: 25.sp,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Row(
                    children: [
                      Expanded(
                        child: DefaultMaterialButton(
                          onPressed: () {},
                          padding: const EdgeInsets.all(15),
                          text: 'facebook',
                          fontSize: 15.sp,
                          background: defaultFacebookColor,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: DefaultMaterialButton(
                          onPressed: () {},
                          padding: const EdgeInsets.all(15),
                          text: 'twitter',
                          fontSize: 15.sp,
                          background: defaultTwiiterColor,
                        ),
                      ),
                    ],
                  ),
                ),
                const Center(
                  child: DefaultText(
                    text: 'or sign up with email',
                    color: defaultGray,
                  ),
                ),
                AuthFormField(
                  controller: TextEditingController(),
                  keyboardType: TextInputType.text,
                  hintText: 'enter first name ',
                  uphintText: 'First name',
                ),
                AuthFormField(
                  controller: TextEditingController(),
                  keyboardType: TextInputType.text,
                  hintText: 'enter last name ',
                  uphintText: 'Last name',
                ),
                AuthFormField(
                  controller: TextEditingController(),
                  keyboardType: TextInputType.text,
                  hintText: 'enter your email',
                  uphintText: 'Your email',
                ),
                AuthFormField(
                  controller: TextEditingController(),
                  keyboardType: TextInputType.text,
                  hintText: 'enter your password',
                  uphintText: 'password',
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: DefaultMaterialButton(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    onPressed: () {
                      Navigator.pushNamed(context, appLayoutRoute);
                    },
                    background: defaultLightTealColor,
                    text: 'Sign up',
                    fontSize: 15.sp,
                  ),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: DefaultText(
                      text:
                          'By Signing up you agreed with our terms of \n Services and privacy policy',
                      maxLines: 3,
                      textAlign: TextAlign.center,
                      color: defaultGray,
                      fontSize: 11.5.sp,
                    ),
                  ),
                ),
                Center(
                  child: InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, appLayoutRoute);
                    },
                    child: RichText(
                      text: TextSpan(
                        text: "Already have an account ? ",
                        style: TextStyle(color: defaultGray, fontSize: 12.sp),
                        children: <TextSpan>[
                          TextSpan(
                              text: 'Login',
                              style: TextStyle(
                                  color: defaultLightTealColor,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15.sp)),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
