import 'package:algoriza_team_6_realestate_app/styles/colors.dart';
import 'package:algoriza_team_6_realestate_app/widgets/auth_form_field.dart';
import 'package:algoriza_team_6_realestate_app/widgets/default_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../business_logic/cubit/auth_cubit/auth_cubit.dart';
import '../../constants/constant_methods.dart';
import '../../constants/constants.dart';
import '../../constants/screens.dart';
import '../../data/di/di.dart';
import '../../widgets/default_loading_indicator.dart';
import '../../widgets/default_material_button.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final passwordConfirmationController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  late AuthCubit cubit;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<AuthCubit>(),
      child: Builder(builder: (context) {
        cubit = sl<AuthCubit>();
        return Scaffold(
          body: SafeArea(
            child: Form(
              key: _formKey,
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
                        padding: EdgeInsets.symmetric(vertical: 5.h),
                        child: Row(
                          children: [
                            Expanded(
                              child: DefaultMaterialButton(
                                onPressed: () {},
                                padding: EdgeInsets.all(13.sp),
                                text: 'facebook',
                                fontSize: 15.sp,
                                background: defaultFacebookColor,
                              ),
                            ),
                            SizedBox(
                              width: 3.w,
                            ),
                            Expanded(
                              child: DefaultMaterialButton(
                                onPressed: () {},
                                padding: EdgeInsets.all(13.sp),
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
                          text: 'or sign up with email',
                          color: defaultGray,
                        ),
                      ),
                      AuthFormField(
                        controller: firstNameController,
                        validator: (value) => emailController.text.isEmpty
                            ? "First Name can't be empty"
                            : null,
                        keyboardType: TextInputType.text,
                        hintText: 'Enter first name ',
                        upHintText: 'First name',
                      ),
                      //
                      AuthFormField(
                        controller: lastNameController,
                        validator: (value) => emailController.text.isEmpty
                            ? "Last Name can't be empty"
                            : null,
                        keyboardType: TextInputType.text,
                        hintText: 'Enter last name ',
                        upHintText: 'Last name',
                      ),
                      AuthFormField(
                        controller: emailController,
                        validator: (value) => emailController.text.isEmpty
                            ? "E-mail can't be empty"
                            : null,
                        keyboardType: TextInputType.text,
                        hintText: 'Enter your email',
                        upHintText: 'Your email',
                      ),
                      AuthFormField(
                        controller: passwordController,
                        validator: (value) {
                          if (passwordController.text.isEmpty) {
                            return "Password can't be empty";
                          } else if (passwordController.text.length <= 6) {
                            return 'Your password must be longer than 6 characters';
                          }
                          return null;
                        },
                        obscureText: true,
                        maxLines: 1,
                        keyboardType: TextInputType.text,
                        hintText: 'Enter your password',
                        upHintText: 'password',
                      ),
                      AuthFormField(
                        controller: passwordConfirmationController,
                        validator: (value) {
                          if (passwordController.text.isEmpty) {
                            return "Password can't be empty";
                          } else if (passwordController.text.length <= 6) {
                            return 'Your password must be longer than 6 characters';
                          }
                          return null;
                        },
                        obscureText: true,
                        maxLines: 1,
                        keyboardType: TextInputType.text,
                        hintText: 'Re-Enter your password',
                        upHintText: 'confirm password',
                      ),
                      BlocConsumer<AuthCubit, AuthState>(
                        listener: (context, state) {
                          if (state is RegisterSuccessState) {
                            Navigator.pushNamed(context, appLayoutRoute);
                          } else if (state is RegisterFailureState) {
                            setState(() {});
                            showToastMsg(
                              msg: state.errorMessage!,
                              toastState: ToastStates.ERROR,
                            );
                          }
                        },
                        builder: (context, state) {
                          if (state is LoginLoadingState) {
                            return Padding(
                              padding: EdgeInsets.symmetric(vertical: 2.h),
                              child: const DefaultLoadingIndicator(),
                            );
                          } else {
                            return Padding(
                              padding: EdgeInsets.symmetric(vertical: 2.h),
                              child: DefaultMaterialButton(
                                padding: EdgeInsets.symmetric(vertical: 3.h),
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    cubit.register(
                                      name:
                                          '${firstNameController.text} ${lastNameController.text}',
                                      email: emailController.text,
                                      password: passwordController.text,
                                      passwordConfirmation:
                                          passwordConfirmationController.text,
                                    );
                                  }
                                },
                                background: defaultLightTealColor,
                                text: 'Sign up',
                                fontSize: 15.sp,
                              ),
                            );
                          }
                        },
                      ),
                      Center(
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 1.h),
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
                            Navigator.pop(context);
                          },
                          child: RichText(
                            text: TextSpan(
                              text: "Already have an account ? ",
                              style: TextStyle(
                                  color: defaultGray, fontSize: 12.sp),
                              children: <TextSpan>[
                                TextSpan(
                                    text: 'Login',
                                    style: TextStyle(
                                        color: defaultTwitterColor,
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
          ),
        );
      }),
    );
  }
}
