import 'package:algoriza_team_6_realestate_app/constants/constant_methods.dart';
import 'package:algoriza_team_6_realestate_app/constants/constants.dart';
import 'package:algoriza_team_6_realestate_app/constants/screens.dart';
import 'package:algoriza_team_6_realestate_app/data/di/di.dart';
import 'package:algoriza_team_6_realestate_app/data/source/network/endpoints.dart';
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

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  late AuthCubit cubit;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<AuthCubit>(),
      child: Builder(
        builder: (context) {
          cubit = sl<AuthCubit>();
          return Scaffold(
            body: SafeArea(
              child: Padding(
                padding: EdgeInsets.all(15.sp),
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
                                width: 5.w,
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
                            text: 'or log in with email',
                            color: defaultGray,
                          ),
                        ),
                        AuthFormField(
                          validator: (value) =>
                          emailController.text.isEmpty
                              ? "E-mail can't be empty"
                              : null,
                          controller: emailController,
                          keyboardType: TextInputType.text,
                          hintText: 'Enter your email',
                          uphintText: 'Your email',
                        ),
                        AuthFormField(
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
                          controller: passwordController,
                          keyboardType: TextInputType.text,
                          hintText: 'Enter your password',
                          uphintText: 'password',
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
                        BlocConsumer<AuthCubit, AuthState>(
                          listener: (context, state) {
                            if(state is LoginSuccessState){
                              Navigator.pushNamed(context, appLayoutRoute);
                            }else if(state is LoginFailureState){
                              showToastMsg(
                                  msg: state.errorMessage,
                                  toastState: ToastStates.ERROR,
                              );
                            }
                          },
                          builder: (context, state) {
                            if(state is LoginLoadingState) {
                              return const DefaultLoadingIndicator();
                            }else {
                              return DefaultMaterialButton(
                                padding: EdgeInsets.symmetric(vertical: 1.h),
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    cubit.login(
                                        email: emailController.text,
                                        password: passwordController.text);
                                  }
                                },
                                background: defaultLightTealColor,
                                text: 'Login',
                                fontSize: 15.sp,
                              );
                            }
                          },
                        ),
                        Center(
                          child: InkWell(
                            onTap: () {
                              Navigator.pushNamed(context, registerEP);
                            },
                            child: RichText(
                              text: TextSpan(
                                text: "Don't have an account ? ",
                                style: TextStyle(
                                    color: defaultGray, fontSize: 12.sp),
                                children: <TextSpan>[
                                  TextSpan(
                                      text: 'Register',
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
        }
      ),
    );
  }
}
