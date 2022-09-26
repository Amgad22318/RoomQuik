import 'package:algoriza_team_6_realestate_app/constants/constant_methods.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../business_logic/cubit/profile_cubit/profile_cubit.dart';
import '../../constants/constants.dart';
import '../../data/di/di.dart';
import '../../data/models/responses/auth_model/auth_model.dart';
import '../../widgets/default_form_field.dart';
import '../../widgets/default_loading_indicator.dart';
import '../../widgets/default_material_button.dart';
import '../../widgets/default_text.dart';

class ChangePassword extends StatefulWidget {
  Auth myProfile;

  ChangePassword({Key? key, required this.myProfile}) : super(key: key);

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  late ProfileCubit cubit;
  var formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    cubit = sl<ProfileCubit>();
  }

  @override
  Widget build(BuildContext context) {
    var passwordController = TextEditingController();
    var confirmPasswordController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios)),
        title: const DefaultText(
          text: 'Change Password',
          fontWeight: FontWeight.bold,
        ),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 2.h),
                child: Center(
                  child: DefaultText(
                    text: 'Please Enter Your New Password',
                    fontSize: 15.sp,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 5.w),
                child: DefaultFormField(
                  hintText: 'New Password',
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
                  prefixIcon: const Icon(Icons.password),
                  controller: passwordController,
                  keyboardType: TextInputType.text,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 5.w,
                ).copyWith(bottom: 4.h),
                child: DefaultFormField(
                  hintText: 'Confirm New Password',
                  validator: (value) {
                    if (confirmPasswordController.text.isEmpty) {
                      return "Password can't be empty";
                    } else if (confirmPasswordController.text.length <= 6) {
                      return 'Your password must be longer than 6 characters';
                    }
                    return null;
                  },
                  obscureText: true,
                  maxLines: 1,
                  prefixIcon: const Icon(Icons.password_outlined),
                  controller: confirmPasswordController,
                  keyboardType: TextInputType.emailAddress,
                ),
              ),
              BlocConsumer<ProfileCubit, ProfileState>(
                listener: (context, state) {
                  if (state is UpdateProfileSuccessState) {
                    showToastMsg(
                      msg: 'Changing Password Succeeded',
                      toastState: ToastStates.SUCCESS,
                    );
                    Navigator.pop(context);
                  } else if (state is UpdateProfileFailureState) {
                    showToastMsg(
                      msg: state.errorMessage,
                      toastState: ToastStates.ERROR,
                    );
                  }
                },
                builder: (context, state) {
                  if (state is UpdateProfileLoadingState) {
                    return const DefaultLoadingIndicator();
                  } else {
                    return DefaultMaterialButton(
                      margin: EdgeInsets.symmetric(
                        horizontal: 5.w,
                      ),
                      radius: 25.sp,
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          cubit.updateProfile(
                              name: widget.myProfile.data.name,
                              email: widget.myProfile.data.email,
                              password: passwordController.text,
                              passwordConfirmation:
                                  confirmPasswordController.text);
                        }
                      },
                      child: DefaultText(
                        text: 'Apply',
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w800,
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
