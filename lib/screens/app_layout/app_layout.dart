import 'package:algoriza_team_6_realestate_app/business_logic/cubit/home_cubit/home_cubit.dart';
import 'package:algoriza_team_6_realestate_app/business_logic/cubit/profile_cubit/profile_cubit.dart';
import 'package:algoriza_team_6_realestate_app/constants/constant_methods.dart';
import 'package:algoriza_team_6_realestate_app/screens/home/home_screen.dart';
import 'package:algoriza_team_6_realestate_app/screens/my_booking/my_booking_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/di/di.dart';
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
    locationPermission();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => sl<HomeCubit>()..getHotels(1),
          lazy: false,
        ),
        BlocProvider(
          create: (context) => sl<ProfileCubit>()..getProfileInfo(),
          lazy: false,
        ),
      ],
      child: Scaffold(
        body:
            SafeArea(child: _navigationBarScreenList.elementAt(_selectedIndex)),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.home_work_rounded),
              label: 'Booking',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
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
