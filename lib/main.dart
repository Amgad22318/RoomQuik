import 'package:algoriza_team_6_realestate_app/business_logic/cubit/global_cubit/global_cubit.dart';
import 'package:algoriza_team_6_realestate_app/business_logic/cubit/profile_cubit/profile_cubit.dart';
import 'package:algoriza_team_6_realestate_app/data/source/local/my_shared_preferences.dart';
import 'package:algoriza_team_6_realestate_app/router/app_router.dart';
import 'package:algoriza_team_6_realestate_app/styles/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import 'business_logic/cubit/observer.dart';
import 'data/di/di.dart';

Future<void> main() async {
  Bloc.observer = MyBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();
  init();
  await sl<MySharedPref>().initSP();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    setState(() {});
  }

  late GlobalCubit globalCubit;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => sl<GlobalCubit>(),
        ),
        BlocProvider(
          create: (context) => sl<ProfileCubit>(),
        ),
      ],
      child: BlocBuilder<GlobalCubit, GlobalStates>(
        builder: (context, state) {
          return Sizer(
            builder: (context, orientation, deviceType) {
              globalCubit = sl<GlobalCubit>();
              globalCubit.getAppTheme();
              return MaterialApp(
                theme: globalCubit.isLightTheme
                    ? Themes.lightTheme
                    : Themes.darkTheme,
                debugShowCheckedModeBanner: false,
                onGenerateRoute: sl<AppRouter>().onGenerateRoute,
              );
            },
          );
        },
      ),
    );
  }
}
