import 'package:algoriza_team_6_realestate_app/constants/screens.dart';
import 'package:algoriza_team_6_realestate_app/styles/colors.dart';
import 'package:algoriza_team_6_realestate_app/widgets/auth_form_field.dart';
import 'package:algoriza_team_6_realestate_app/widgets/default_text.dart';
import 'package:algoriza_team_6_realestate_app/widgets/default_text_button.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../widgets/default_material_button.dart';

class Login extends StatelessWidget {
  Login({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DefaultText(
                    text: 'Login',
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
                            background: defaultTwitterColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Center(
                    child: DefaultText(
                      text: 'or log in with email',
                      color: defaultGray,
                    ),
                  ),
                  AuthFormField(
                    validator: (value) => value!.length <= 6
                        ? 'Your password must be larger than 6 characters'
                        : null,
                    controller: TextEditingController(),
                    keyboardType: TextInputType.text,
                    hintText: 'enter your email',
                    upHintText: 'Your email',
                  ),
                  AuthFormField(
                    controller: TextEditingController(),
                    keyboardType: TextInputType.text,
                    hintText: 'enter your password',
                    upHintText: 'password',
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: DefaultTextButton(
                      onPressed: () {},
                      child: const DefaultText(
                        text: 'Forget your password ?',
                        color: defaultGray,
                      ),
                    ),
                  ),
                  DefaultMaterialButton(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Navigator.pushNamed(context, appLayoutRoute);
                      }
                    },
                    background: defaultLightTealColor,
                    text: 'Login',
                    fontSize: 15.sp,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
