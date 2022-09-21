import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../styles/colors.dart';
import '../../widgets/default_material_button.dart';
import '../../widgets/default_text.dart';
import '../../widgets/default_text_form_field.dart';

class ChangePassword extends StatelessWidget {
  const ChangePassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var password = TextEditingController();
    var confirm_password = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios)),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DefaultText(
              text: 'Change Password',
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            SizedBox(
              height: 15,
            ),
            DefaultText(
              text: 'Please Enter Your New Password',
              fontSize: 15.sp,
              color: Colors.black,
            ),
            SizedBox(
              height: 15,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 17.0),
                  child: DefaultText(
                    text: 'New Password',
                    fontSize: 20.sp,
                    color: Colors.black,
                  ),
                ),
                DefaultTextFormField(
                  fontweight: FontWeight.w500,
                  controllerr: password,
                  type: TextInputType.text,
                  label: ' ',
                  radius: 0,
                  fonts: 20.sp,
                  readonly: false,
                  ispassword: false,
                  bradius: 25,
                  enabledbprder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                  focusedborder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                  filled: true,
                  fillcolor: Colors.blueGrey.withOpacity(0.5),
                  vertical: 15,
                  hint: 'Enter New Password',
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 17.0),
                  child: DefaultText(
                    text: 'Confirm Password',
                    fontSize: 20.sp,
                    color: Colors.black,
                  ),
                ),
                DefaultTextFormField(
                  fontweight: FontWeight.w500,
                  controllerr: password,
                  type: TextInputType.text,
                  label: ' ',
                  radius: 0,
                  fonts: 20.sp,
                  readonly: false,
                  ispassword: false,
                  bradius: 25,
                  enabledbprder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                  focusedborder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                  filled: true,
                  fillcolor: Colors.blueGrey.withOpacity(0.5),
                  vertical: 15,
                  hint: 'Enter confirm Password',
                ),
                SizedBox(
                  height: 25,
                ),
                DefaultMaterialButton(
                  height: 62,
                  radius: 25,
                  onPressed: () {},
                  child: DefaultText(
                    text: 'Apply',
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w800,

                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
