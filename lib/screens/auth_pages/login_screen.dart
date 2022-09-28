import 'package:algoriza_team_6_realestate_app/constants/constant_methods.dart';
import 'package:algoriza_team_6_realestate_app/constants/constants.dart';
import 'package:algoriza_team_6_realestate_app/constants/screens.dart';
import 'package:algoriza_team_6_realestate_app/data/di/di.dart';
import 'package:algoriza_team_6_realestate_app/styles/colors.dart';
import 'package:algoriza_team_6_realestate_app/widgets/auth_form_field.dart';
import 'package:algoriza_team_6_realestate_app/widgets/default_loading_indicator.dart';
import 'package:algoriza_team_6_realestate_app/widgets/default_text.dart';
import 'package:algoriza_team_6_realestate_app/widgets/default_text_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../business_logic/cubit/auth_cubit/auth_cubit.dart';
import '../../widgets/default_material_button.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  late AuthCubit authCubit;
  @override
  void initState() {
    authCubit = sl<AuthCubit>();
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => authCubit,
      child: Builder(builder: (context) {
        return Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: EdgeInsets.all(15.sp),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      DefaultText(
                        text: 'Login',
                        fontSize: 25.sp,
                        fontWeight: FontWeight.bold,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 5.h),
                        child: Row(
                          children: [
                            const Spacer(),
                            Expanded(
                              flex: 8,
                              child: DefaultMaterialButton(
                                onPressed: () {},
                                text: 'Facebook',
                                fontSize: 15.sp,
                                background: defaultFacebookColor,
                              ),
                            ),
                            const Spacer(
                              flex: 2,
                            ),
                            Expanded(
                              flex: 8,
                              child: DefaultMaterialButton(
                                onPressed: () {},
                                text: 'Twitter',
                                fontSize: 15.sp,
                                background: defaultTwitterColor,
                              ),
                            ),
                            const Spacer(),
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
                        autofocus: true,
                        textInputAction: TextInputAction.next,
                        validator: (value) => emailController.text.isEmpty
                            ? "E-mail can't be empty"
                            : null,
                        controller: emailController,
                        keyboardType: TextInputType.text,
                        hintText: 'Enter your email',
                        upHintText: 'Your email',
                      ),
                      AuthFormField(
                        validator: (value) {
                          if (passwordController.text.isEmpty) {
                            return "Password can't be empty";
                          } else if (passwordController.text.length < 6) {
                            return 'Your password must be longer than 6 characters';
                          }
                          return null;
                        },
                        obscureText: true,
                        maxLines: 1,
                        controller: passwordController,
                        keyboardType: TextInputType.text,
                        hintText: 'Enter your password',
                        upHintText: 'password',
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: DefaultTextButton(
                          onPressed: () {},
                          child: const DefaultText(
                            text: 'Forget your password ?',
                            color: defaultGray,
                          ),
                        ),
                      ),
                      BlocConsumer<AuthCubit, AuthState>(
                        listener: (context, state) {
                          if (state is LoginSuccessState) {
                            Navigator.pushNamedAndRemoveUntil(
                                context, appLayoutRoute, (route) => false);
                          } else if (state is LoginFailureState) {
                            showToastMsg(
                              msg: state.errorMessage,
                              toastState: ToastStates.error,
                            );
                          }
                        },
                        builder: (context, state) {
                          if (state is LoginLoadingState) {
                            return const DefaultLoadingIndicator();
                          } else {
                            return DefaultMaterialButton(
                              padding: EdgeInsets.symmetric(vertical: 1.h),
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  authCubit.login(
                                      email: emailController.text,
                                      password: passwordController.text);
                                }
                              },
                              background: darkOrLightColor(
                                  defaultAppColor4, defaultAppColor),
                              text: 'Login',
                              fontSize: 15.sp,
                            );
                          }
                        },
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          DefaultText(
                            text: "Don't have an account ? ",
                            color: defaultGray,
                            fontSize: 12.sp,
                          ),
                          DefaultTextButton(
                              onPressed: () {
                                Navigator.pushReplacementNamed(
                                    context, signupRoute);
                              },
                              child: DefaultText(
                                  text: 'Register',
                                  color: darkOrLightColor(
                                      defaultAppColor4, defaultAppColor),
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15.sp))
                        ],
                      )
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
