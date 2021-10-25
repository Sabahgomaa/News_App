import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/Theme/Cubit/state.dart';
import 'package:news/core/CacheHelper/cache_helper.dart';

class ThemeCubit extends Cubit<ThemeStates> {
  ThemeCubit() : super(AppInitialState());

  static ThemeCubit get(context) => BlocProvider.of(context);

  bool isDark = false;

  void changeAppMode({bool? fromShared}) {
    if (fromShared != null) {
      isDark = fromShared;
      emit(ChangeThemeModeState());
    } else {
      isDark = !isDark;
      CacheHelper.putBoolen(key: 'isDark', value: isDark)!.then((value) {
        emit(ChangeThemeModeState());
      });
    }
  }
}
