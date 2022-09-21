import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../widgets/default_text.dart';
import '../../widgets/default_text_form_field.dart';

class Change_password extends StatelessWidget {
  const Change_password({Key? key}) : super(key: key);

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
        padding: const EdgeInsets.all(8.0),
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
            DefaultTextFormField(
              fontweight: FontWeight.w500,
              controllerr: password,
              type: TextInputType.text,
              label: 'New Password',
              radius: 0,
              fonts: 20.sp,
              readonly: false,
              ispassword: false,
              bradius: 20,
              hint: 'Enter New Password',


            ),
            SizedBox(
              height: 15,
            ),
            DefaultTextFormField(
              fontweight: FontWeight.w500,
              controllerr: password,
              type: TextInputType.text,
              label: 'Confirm Password',
              radius: 0,
              fonts: 20.sp,
              readonly: false,
              ispassword: false,
              bradius: 20,
              hint: 'Enter confirm Password',
            ),
          ],
        ),
      ),
    );
  }
}
