import 'package:flutter/material.dart';
import 'package:news/views/HomeLayout/cubit/cubits.dart';

class NavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cubit = HomeCubit.get(context);
    return BottomNavigationBar(
      currentIndex: cubit.currentindex,
      onTap: (index) {
        cubit.changeBottomNavBar(index);
      },
      items: cubit.items,
    );
  }
}
