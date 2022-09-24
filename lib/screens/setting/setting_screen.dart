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
    return SafeArea(
      child: BlocBuilder<GlobalCubit, GlobalStates>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              elevation: 0,
              title: const DefaultText(
                text: 'Setting',
                fontWeight: FontWeight.bold,
              ),
              centerTitle: true,
            ),
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    ListTile(
                      onTap: () {},
                      title: Row(
                        children: [
                          Expanded(
                            child: DefaultText(
                              text: 'Notifications',
                            ),
                          ),
                          Icon(Icons.notifications)
                        ],
                      ),
                    ),
                    ListTile(
                      onTap: () {},
                      title: Row(
                        children: [
                          Expanded(
                            child: DefaultText(
                              text: 'Theme Mode',
                            ),
                          ),
                          Icon(Icons.dark_mode)
                        ],
                      ),
                    ),
                    ListTile(
                      onTap: () {},
                      title: Row(
                        children: [
                          Expanded(
                            child: DefaultText(
                              text: 'Fonts',
                            ),
                          ),
                          Icon(Icons.font_download)
                        ],
                      ),
                    ),
                    ListTile(
                      onTap: () {},
                      title: Row(
                        children: [
                          Expanded(
                            child: DefaultText(
                              text: 'Color',
                            ),
                          ),
                          Icon(Icons.color_lens)
                        ],
                      ),
                    ),
                    ListTile(
                      onTap: () {},
                      title: Row(
                        children: [
                          Expanded(
                            child: DefaultText(
                              text: 'Language',
                            ),
                          ),
                          Icon(Icons.language)
                        ],
                      ),
                    ),
                    ListTile(
                      onTap: () {},
                      title: Row(
                        children: [
                          Expanded(
                            child: DefaultText(
                              text: 'Country',
                            ),
                          ),
                          DefaultText(text: 'Egypt',),
                        ],
                      ),
                    ),
                    ListTile(
                      onTap: () {},
                      title: Row(
                        children: [
                          Expanded(
                            child: DefaultText(
                              text: 'Currency',
                            ),
                          ),
                          DefaultText(text: '\$ AED')
                        ],
                      ),
                    ),
                    ListTile(
                      onTap: () {},
                      title: Row(
                        children: [
                          Expanded(
                            child: DefaultText(
                              text: 'Terms of Service',
                            ),
                          ),
                          Icon(Icons.arrow_forward_ios_rounded)
                        ],
                      ),
                    ),
                    ListTile(
                      onTap: () {},
                      title: Row(
                        children: [
                          Expanded(
                            child: DefaultText(
                              text: 'Terms of Service',
                            ),
                          ),
                          Icon(Icons.arrow_forward_ios_rounded)
                        ],
                      ),
                    ),
                    ListTile(
                      onTap: () {},
                      title: Row(
                        children: [
                          Expanded(
                            child: DefaultText(
                              text: 'Terms of Service',
                            ),
                          ),
                          Icon(Icons.arrow_forward_ios_rounded)
                        ],
                      ),
                    ),
                    ListTile(
                      onTap: () {},
                      title: Row(
                        children: [
                          DefaultText(
                            text: 'Log Out',
                          ),
                        ],
                      ),
                    ),

                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
