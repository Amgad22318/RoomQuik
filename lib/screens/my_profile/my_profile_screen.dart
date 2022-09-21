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
              padding: const EdgeInsets.only(top: 30.0,bottom: 5,left: 7),
              child: InkWell(
                onTap: (){
                  Navigator.pushNamed(context, UpdateProfileRoute);
                },
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        DefaultText(text: 'Amanda',fontSize: 30.sp,color: Colors.black,fontWeight: FontWeight.bold,),
                        SizedBox(height: 10,),
                        DefaultText(text: 'View and Edit Profile',fontSize: 18.sp,color: Colors.black,fontWeight: FontWeight.w500,),
                      ],
                    ),
                    Spacer(),
                    CircleAvatar(
                      radius: 35,
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: InkWell(onTap: (){
                Navigator.pushNamed(context, ChangePasswordRoute);
              },
                child: DefaultTextFormField(
                  controllerr: changepasswordontroller,
                  type: TextInputType.text,
                  label: 'Change Password',
                  fontweight: FontWeight.bold,
                  focusedborder: InputBorder.none,
                  enabledbprder: InputBorder.none,
                  erroborder: InputBorder.none,
                  disabledborder: InputBorder.none,

                  radius: 1,
                  fonts: 25,
                  bradius: 15,
                  enabled: false,
                  max: 8,
                  readonly: true,
                  suffix: Icons.lock,
                  border: OutlineInputBorder(),
                  ispassword: false,

                ),
              ),
            ),
            Container(
              color: Colors.grey,
              height: 1,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: InkWell(onTap: (){},
                child: DefaultTextFormField(
                  controllerr: invitefriendscontroller,
                  type: TextInputType.text,
                  label: 'Invite Friends',
                  fontweight: FontWeight.bold,
                  radius: 1,
                  focusedborder: InputBorder.none,
                  enabledbprder: InputBorder.none,
                  erroborder: InputBorder.none,
                  disabledborder: InputBorder.none,
                  enabled: false,

                  fonts: 25,
                  bradius: 15,
                  max: 8,
                  readonly: false,
                  suffix: Icons.person_add,
                  border: OutlineInputBorder(),
                  ispassword: false,

                ),
              ),
            ),
            Container(
              color: Colors.grey,
              height: 1,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: InkWell(onTap: (){},
                child: DefaultTextFormField(
                  controllerr: creditcontroller,
                  type: TextInputType.text,
                  label: 'Credit & Coupons',
                  enabled: false,
                  focusedborder: InputBorder.none,
                  enabledbprder: InputBorder.none,
                  erroborder: InputBorder.none,
                  disabledborder: InputBorder.none,
                  fontweight: FontWeight.bold,
                  radius: 1,
                  fonts: 25,
                  bradius: 15,
                  max: 8,
                  readonly: false,
                  suffix: Icons.card_giftcard,
                  border: OutlineInputBorder(),
                  ispassword: false,

                ),
              ),
            ),
            Container(
              color: Colors.grey,
              height: 1,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: InkWell(onTap: (){},
                child: DefaultTextFormField(
                  controllerr: helpcontroller,
                  type: TextInputType.text,
                  label: 'Help Center',
                  enabled: false,

                  fontweight: FontWeight.bold,
                  radius: 1,
                  fonts: 25,
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
            ),
            Container(
              color: Colors.grey,
              height: 1,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: InkWell(onTap: (){},
                child: DefaultTextFormField(
                  controllerr: paymentcontroller,
                  type: TextInputType.text,
                  label: 'Payment',
                  enabled: false,
                  fontweight: FontWeight.bold,
                  radius: 1,
                  fonts: 25,
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
            ),
            Container(
              color: Colors.grey,
              height: 1,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: InkWell(onTap: (){
                Navigator.pushNamed(context, settingScreenRoute);
              },
                child: DefaultTextFormField(
                  controllerr: settingscontroller,
                  type: TextInputType.text,
                  label: 'Settings',
                  enabled: false,
                  fontweight: FontWeight.bold,
                  radius: 1,
                  fonts: 25,
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
            ),

          ],
        ),
      ),
    );
  }
}
