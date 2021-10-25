import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:news/Theme/Cubit/cubit.dart';
import 'package:news/Theme/Cubit/state.dart';
import 'package:news/core/BlocObserver/bloc_observer.dart';
import 'package:news/core/CacheHelper/cache_helper.dart';
import 'package:news/core/DioHelper/dio_helper.dart';
import 'package:news/views/HomeLayout/cubit/cubits.dart';
import 'package:news/views/HomeLayout/view.dart';

void main() async {
  // بيتأكد ان كل حاجه هنا في الميثود خلصت و بعدين يتفح الابلكيشن
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CacheHelper.init();

  bool? isDark = CacheHelper.getBoolean(key: 'isDark');
  runApp(MyApp(isDark));
}

class MyApp extends StatelessWidget {
  final bool? isDark;
  MyApp(this.isDark);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => HomeCubit()
              ..getSports()
              ..getScience()
              ..getBusiness(),
          ),
          BlocProvider(
            create: (BuildContext context) => ThemeCubit()
              ..changeAppMode(
                fromShared: isDark,
              ),
          ),
        ],
        child: BlocConsumer<ThemeCubit, ThemeStates>(
            listener: (context, state) {},
            builder: (context, state) {
              return MaterialApp(
                  debugShowCheckedModeBanner: false,
                  theme: ThemeData(
                    scaffoldBackgroundColor: Colors.white,
                    appBarTheme: AppBarTheme(
                      backwardsCompatibility: false,
                      systemOverlayStyle: SystemUiOverlayStyle(
                        statusBarColor: Colors.white,
                        statusBarIconBrightness: Brightness.dark,
                      ),
                      backgroundColor: Colors.white,
                      elevation: 0.0,
                      titleTextStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                      iconTheme: IconThemeData(
                        color: Colors.black,
                      ),
                    ),
                    bottomNavigationBarTheme: BottomNavigationBarThemeData(
                      type: BottomNavigationBarType.fixed,
                      selectedItemColor: Colors.deepOrange,
                      elevation: 20.0,
                    ),
                    textTheme: TextTheme(
                      bodyText1: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  darkTheme: ThemeData(
                    primarySwatch: Colors.deepOrange,
                    scaffoldBackgroundColor: HexColor('333739'),
                    appBarTheme: AppBarTheme(
                      titleSpacing: 20.0,
                      backwardsCompatibility: false,
                      systemOverlayStyle: SystemUiOverlayStyle(
                        statusBarColor: HexColor('333739'),
                        statusBarIconBrightness: Brightness.light,
                      ),
                      backgroundColor: HexColor('333739'),
                      elevation: 0.0,
                      titleTextStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                      iconTheme: IconThemeData(
                        color: Colors.white,
                      ),
                    ),
                    floatingActionButtonTheme: FloatingActionButtonThemeData(
                      backgroundColor: Colors.deepOrange,
                    ),
                    bottomNavigationBarTheme: BottomNavigationBarThemeData(
                      type: BottomNavigationBarType.fixed,
                      selectedItemColor: Colors.deepOrange,
                      unselectedItemColor: Colors.grey,
                      elevation: 20.0,
                      backgroundColor: HexColor('333739'),
                    ),
                    textTheme: TextTheme(
                      bodyText1: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  themeMode: ThemeCubit.get(context).isDark
                      ? ThemeMode.dark
                      : ThemeMode.light,
                  home: Directionality(
                      textDirection: TextDirection.ltr, child: Homelayout()));
            }));
  }
}
