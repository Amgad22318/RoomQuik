import 'package:algoriza_team_6_realestate_app/business_logic/cubit/profile_cubit/profile_cubit.dart';
import 'package:algoriza_team_6_realestate_app/widgets/default_cached_network_image.dart';
import 'package:algoriza_team_6_realestate_app/widgets/default_list_tile.dart';
import 'package:algoriza_team_6_realestate_app/widgets/horizontal_divider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import '../../constants/screens.dart';
import '../../styles/colors.dart';
import '../../widgets/default_text.dart';

class MyProfileScreen extends StatelessWidget {
  const MyProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ProfileCubit cubit = ProfileCubit.get(context);

    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [

            InkWell(
              onTap: () {
                Navigator.pushNamed(context, UpdateProfileRoute);
              },
              child: BlocBuilder<ProfileCubit, ProfileState>(
                builder: (context, state) {
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            DefaultText(
                              text: cubit.auth.data.name == ''
                                  ? 'User Name'
                                  : cubit.auth.data.name,
                              fontSize: 15.sp,
                              fontWeight: FontWeight.bold,
                            ),
                            SizedBox(
                              height: 1.h,
                            ),
                            DefaultText(
                              text: 'View and Edit Profile',
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w500,
                              color: defaultGray,
                            ),
                          ],
                        ),
                        const Spacer(),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(35.sp),
                          child: DefaultCachedNetworkImage(
                            imageUrl: cubit.auth.data.image,
                            fit: BoxFit.cover,
                          ),
                        )

                      ],
                    ),
                  );
                },
              ),
            ),

            InkWell(
              onTap: () {
                Navigator.pushNamed(context, ChangePasswordRoute);
              },
              child: const DefaultListTile(
                  title: 'Change Password',
                  trailingIcon: Icons.lock,
              ),
            ),
            const HorizontalDivider(),
            InkWell(
              onTap: (){},
              child: const DefaultListTile(
                title: 'Invite Friends',
                trailingIcon: Icons.person_add,
              ),
            ),
            const HorizontalDivider(),
            InkWell(
              onTap: () {},
              child: const DefaultListTile(
                title: 'Credit & Coupons',
                trailingIcon: Icons.card_giftcard,
              ),
            ),
            const HorizontalDivider(),
            InkWell(
              onTap: () {},
              child: const DefaultListTile(
                title: 'Help Center',
                trailingIcon: Icons.info,
              ),
            ),
            const HorizontalDivider(),
            InkWell(
              onTap: () {},
              child: const DefaultListTile(
                title: 'Payment',
                trailingIcon: Icons.payment,
              ),
            ),
            const HorizontalDivider(),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, settingScreenRoute);
              },
              child: const DefaultListTile(
                title: 'Settings',
                trailingIcon: Icons.settings,

              ),
            ),
          ],
        ),
      ),
    );
  }
}
