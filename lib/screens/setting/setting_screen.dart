import 'package:algoriza_team_6_realestate_app/business_logic/cubit/global_cubit/global_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../data/di/di.dart';
import '../../styles/colors.dart';
import '../../widgets/default_text.dart';

class SettingScreen extends StatelessWidget {
  SettingScreen({Key? key}) : super(key: key);
  final GlobalCubit globalCubit = sl<GlobalCubit>();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GlobalCubit, GlobalStates>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const DefaultText(
              text: 'Setting',
              fontWeight: FontWeight.bold,
            ),
            centerTitle: true,
          ),
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 3.w),
              child: Column(
                children: [
                  Row(
                    children: [
                      DefaultText(text: 'Darkmode', fontSize: 18.sp),
                      const Spacer(),
                      Switch(
                          activeColor: defaultAppColor2,
                          value: !globalCubit.isLightTheme,
                          onChanged: (value) {
                            globalCubit.changeAppTheme();
                          })
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
