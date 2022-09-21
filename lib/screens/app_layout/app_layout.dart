import 'package:algoriza_team_6_realestate_app/business_logic/cubit/home_cubit/home_cubit.dart';
import 'package:algoriza_team_6_realestate_app/business_logic/cubit/profile_cubit/profile_cubit.dart';
import 'package:algoriza_team_6_realestate_app/screens/home/home_screen.dart';
import 'package:algoriza_team_6_realestate_app/screens/my_booking/my_booking_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../styles/colors.dart';
import '../../views/app_layout/app_layout_drawer.dart';
import '../my_profile/my_profile_screen.dart';

class AppLayout extends StatefulWidget {
  final int? route;
  const AppLayout({Key? key, this.route}) : super(key: key);

  @override
  State<AppLayout> createState() => _AppLayoutState();
}

class _AppLayoutState extends State<AppLayout> {
  late int _selectedIndex;
  static const List<Widget> _navigationBarScreenList = <Widget>[
    HomeScreen(),
    MyBookingScreen(),
    MyProfileScreen(),

  ];

  @override
  void initState() {
    _selectedIndex = widget.route ?? 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => HomeCubit()..getFacilities(),
          lazy: false,
        ),
        BlocProvider(
          create: (context) => ProfileCubit()..getProfileInfo(),
          lazy: false,
        ),
      ],
      child: Scaffold(
        drawer: const AppLayoutDrawer(),
        body: _navigationBarScreenList.elementAt(_selectedIndex),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.shifting,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
              backgroundColor: defaultAppColor,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.home_work_rounded),
              label: 'Booking',
              backgroundColor: defaultLightYellowColor,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
              backgroundColor: defaultAppColor2,
            ),
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
        ),
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
