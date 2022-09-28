import 'package:algoriza_team_6_realestate_app/business_logic/cubit/auth_cubit/auth_cubit.dart';
import 'package:algoriza_team_6_realestate_app/business_logic/cubit/filter_cubit/filter_cubit.dart';
import 'package:algoriza_team_6_realestate_app/business_logic/cubit/global_cubit/global_cubit.dart';
import 'package:algoriza_team_6_realestate_app/business_logic/cubit/home_cubit/home_cubit.dart';
import 'package:algoriza_team_6_realestate_app/data/source/local/my_shared_preferences.dart';
import 'package:algoriza_team_6_realestate_app/data/source/network/my_dio.dart';
import 'package:algoriza_team_6_realestate_app/router/app_router.dart';
import 'package:get_it/get_it.dart';

import '../../business_logic/cubit/booking_cubit/booking_cubit.dart';
import '../../business_logic/cubit/profile_cubit/profile_cubit.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerLazySingleton<MyDio>(
    () => MyDio(),
  );
  sl.registerLazySingleton<MySharedPref>(
    () => MySharedPref(),
  );
  sl.registerLazySingleton<AppRouter>(
    () => AppRouter(),
  );
  sl.registerLazySingleton<GlobalCubit>(
    () => GlobalCubit(),
  );
  sl.registerLazySingleton<HomeCubit>(
    () => HomeCubit(),
  );

  sl.registerLazySingleton<FilterCubit>(
    () => FilterCubit(),
  );

  sl.registerLazySingleton<ProfileCubit>(
    () => ProfileCubit(),
  );
  sl.registerFactory<AuthCubit>(
    () => AuthCubit(),
  );
  sl.registerLazySingleton<BookingCubit>(
    () => BookingCubit(),
  );
}
