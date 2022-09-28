import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/di/di.dart';
import '../../../data/source/local/my_shared_preferences.dart';
import '../../../data/source/local/my_shared_preferences_keys.dart';

part 'global_state.dart';

class GlobalCubit extends Cubit<GlobalStates> {
  GlobalCubit() : super(GlobalInitial());

  static GlobalCubit get(context) => BlocProvider.of<GlobalCubit>(context);

  bool isLightTheme = false;
  void changeAppTheme() {
    isLightTheme = !isLightTheme;
    sl<MySharedPref>().putBoolean(key: MySharedKeys.theme, value: isLightTheme);
    emit(ChangeAppThemeState());
  }

  void getAppTheme() {
    isLightTheme =
        sl<MySharedPref>().getBoolean(key: MySharedKeys.theme) ?? true;
  }
}
