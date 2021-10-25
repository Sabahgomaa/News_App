import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/Theme/Cubit/cubit.dart';
import 'package:news/views/HomeLayout/cubit/cubits.dart';
import 'package:news/views/HomeLayout/cubit/states.dart';
import 'package:news/views/HomeLayout/unit/nav_bar.dart';
import 'package:news/views/Search/view.dart';
import 'package:news/widgets/Nav_To.dart';

class Homelayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => HomeCubit(),
        child: BlocConsumer<HomeCubit, HomeStates>(
            listener: (context, state) {},
            builder: (context, state) {
              var cubit = HomeCubit.get(context);
              return Scaffold(
                appBar: AppBar(
                  title: Text(
                    'News App',
                  ),
                  actions: [
                    IconButton(
                      icon: Icon(Icons.search),
                      onPressed: () {
                        navigateTo(context, SearchScreen());
                      },
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.brightness_4_outlined,
                      ),
                      onPressed: () {
                        ThemeCubit.get(context).changeAppMode();
                      },
                    ),
                  ],
                ),
                body: cubit.screens[cubit.currentindex],
                bottomNavigationBar: NavBar(),
              );
            }));
  }
}
