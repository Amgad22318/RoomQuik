import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../constants/screens.dart';
import '../../styles/colors.dart';
import '../../widgets/default_icon_button.dart';
import '../../widgets/default_text.dart';

class AppLayoutDrawer extends StatefulWidget {
  const AppLayoutDrawer({Key? key}) : super(key: key);

  @override
  State<AppLayoutDrawer> createState() => _AppLayoutDrawerState();
}

class _AppLayoutDrawerState extends State<AppLayoutDrawer> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(20.sp),
              bottomRight: Radius.circular(20.sp)),
        ),
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w),
            child: CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [
                SliverToBoxAdapter(
                  child: Column(children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.only(
                            top: 5.0.h,
                          ),
                          child: DefaultIconButton(
                            onPressed: () {
                              Navigator.pushNamed(context, settingRoute);
                            },
                            icon: const Icon(Icons.settings_outlined,
                                color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ]),
                ),
              ],
            )),
      ),
    );
  }
}
