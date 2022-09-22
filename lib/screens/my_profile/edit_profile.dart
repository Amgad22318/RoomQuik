import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../business_logic/cubit/profile_cubit/profile_cubit.dart';
import '../../data/di/di.dart';
import '../../widgets/default_cached_network_image.dart';
import '../../widgets/default_text_form_field.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {

  late ProfileCubit cubit;

  @override
  void initState() {
    super.initState();
     cubit = sl<ProfileCubit>();
  }

  @override
  Widget build(BuildContext context) {
    var nameController = TextEditingController();
    var emailController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios)),
        elevation: 0,
      ),
      body: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          return SafeArea(
            child: Column(
              children: [
                Center(
                  child: Stack(
                    alignment: AlignmentDirectional.bottomEnd,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(70.sp),
                        child: DefaultCachedNetworkImage(
                          imageUrl: cubit.auth.data.image,
                          fit: BoxFit.cover,
                        ),
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.camera_alt,
                            size: 30.sp,
                          ))
                    ],
                  ),
                ),
                DefaultTextFormField(
                  label: 'Name',
                  prefix: Icons.person,
                  controllerr: emailController,
                  type: TextInputType.text,
                  radius: 0,
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  fontweight: FontWeight.bold,
                  fonts: 28.sp,
                  focusedborder: InputBorder.none,
                  enabledbprder: InputBorder.none,
                  erroborder: InputBorder.none,
                  disabledborder: InputBorder.none,
                  readonly: false,
                  max: 0,
                  vertical: 0,
                  ispassword: false,
                ),
                DefaultTextFormField(
                  label: 'E-mail',
                  prefix: Icons.email,
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  vertical: 0,
                  controllerr: nameController,
                  type: TextInputType.text,
                  radius: 0,
                  fontweight: FontWeight.bold,
                  fonts: 28.sp,
                  readonly: false,
                  focusedborder: InputBorder.none,
                  enabledbprder: InputBorder.none,
                  erroborder: InputBorder.none,
                  disabledborder: InputBorder.none,
                  max: 0,
                  ispassword: false,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
