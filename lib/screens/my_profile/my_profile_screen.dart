import 'package:algoriza_team_6_realestate_app/widgets/horizontal_divider.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../constants/screens.dart';
import '../../widgets/default_text.dart';
import '../../widgets/default_text_form_field.dart';

class MyProfileScreen extends StatelessWidget {
  const MyProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var changepasswordontroller = TextEditingController();
    var invitefriendscontroller = TextEditingController();
    var creditcontroller = TextEditingController();
    var helpcontroller = TextEditingController();
    var paymentcontroller = TextEditingController();
    var settingscontroller = TextEditingController();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 7),
              child: InkWell(
                onTap: () {
                  Navigator.pushNamed(context, UpdateProfileRoute);
                },
                child: Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height*.06,
                    ),
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            DefaultText(
                              text: 'Amanda',
                              fontSize: 20.sp,
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            DefaultText(
                              text: 'View and Edit Profile',
                              fontSize: 18.sp,
                              color: Colors.black,
                            ),
                          ],
                        ),
                        Spacer(),
                        CircleAvatar(
                          radius: 35,
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            HorizontalDivider(),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, ChangePasswordRoute);
              },
              child: DefaultTextFormField(
                controllerr: changepasswordontroller,
                type: TextInputType.text,
                label: 'Change Password',
                fontweight: FontWeight.w500,
                focusedborder: InputBorder.none,
                enabledbprder: InputBorder.none,
                erroborder: InputBorder.none,
                disabledborder: InputBorder.none,
                radius: 1,
                fonts: 16.sp,
                bradius: 15,
                enabled: false,
                max: 8,
                readonly: true,
                suffix: Icons.lock,
                border: OutlineInputBorder(),
                ispassword: false,
              ),
            ),
            HorizontalDivider(),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, HotelDetailsRoute);
              },
              child: DefaultTextFormField(
                controllerr: invitefriendscontroller,
                type: TextInputType.text,
                label: 'Invite Friends',
                fontweight: FontWeight.w500,
                radius: 1,
                focusedborder: InputBorder.none,
                enabledbprder: InputBorder.none,
                erroborder: InputBorder.none,
                disabledborder: InputBorder.none,
                enabled: false,
                fonts: 16.sp,
                bradius: 15,
                max: 8,
                readonly: false,
                suffix: Icons.person_add,
                border: OutlineInputBorder(),
                ispassword: false,
              ),
            ),
            HorizontalDivider(),
            InkWell(
              onTap: () {},
              child: DefaultTextFormField(
                controllerr: creditcontroller,
                type: TextInputType.text,
                label: 'Credit & Coupons',
                enabled: false,
                focusedborder: InputBorder.none,
                enabledbprder: InputBorder.none,
                erroborder: InputBorder.none,
                disabledborder: InputBorder.none,
                fontweight: FontWeight.w500,
                radius: 1,
                fonts: 16.sp,
                bradius: 15,
                max: 8,
                readonly: false,
                suffix: Icons.card_giftcard,
                border: OutlineInputBorder(),
                ispassword: false,
              ),
            ),
            HorizontalDivider(),
            InkWell(
              onTap: () {},
              child: DefaultTextFormField(
                controllerr: helpcontroller,
                type: TextInputType.text,
                label: 'Help Center',
                enabled: false,
                fontweight: FontWeight.w500,
                radius: 1,
                fonts: 16.sp,
                bradius: 15,
                max: 8,
                focusedborder: InputBorder.none,
                enabledbprder: InputBorder.none,
                erroborder: InputBorder.none,
                disabledborder: InputBorder.none,
                readonly: false,
                suffix: Icons.info,
                border: OutlineInputBorder(),
                ispassword: false,
              ),
            ),
            HorizontalDivider(),
            InkWell(
              onTap: () {},
              child: DefaultTextFormField(
                controllerr: paymentcontroller,
                type: TextInputType.text,
                label: 'Payment',
                enabled: false,
                fontweight: FontWeight.w500,
                radius: 1,
                fonts: 16.sp,
                bradius: 15,
                focusedborder: InputBorder.none,
                enabledbprder: InputBorder.none,
                erroborder: InputBorder.none,
                disabledborder: InputBorder.none,
                max: 8,
                readonly: false,
                suffix: Icons.payment,
                border: OutlineInputBorder(),
                ispassword: false,
              ),
            ),
            HorizontalDivider(),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, settingScreenRoute);
              },
              child: DefaultTextFormField(
                controllerr: settingscontroller,
                type: TextInputType.text,
                label: 'Settings',
                enabled: false,
                fontweight: FontWeight.w500,
                radius: 1,
                fonts: 16.sp,
                bradius: 15,
                max: 8,
                focusedborder: InputBorder.none,
                enabledbprder: InputBorder.none,
                erroborder: InputBorder.none,
                disabledborder: InputBorder.none,
                readonly: false,
                suffix: Icons.settings,
                border: OutlineInputBorder(),
                ispassword: false,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
