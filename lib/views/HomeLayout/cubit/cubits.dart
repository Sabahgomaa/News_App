import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/core/DioHelper/dio_helper.dart';
import 'package:news/views/HomeLayout/Business/view.dart';
import 'package:news/views/HomeLayout/Sciences/view.dart';
import 'package:news/views/HomeLayout/Sports/view.dart';
import 'package:news/views/HomeLayout/cubit/states.dart';
import 'package:news/views/HomeLayout/settings/view.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitialState());

  static HomeCubit get(context) => BlocProvider.of(context);

  int currentindex = 0;
  List<BottomNavigationBarItem> items = [
    BottomNavigationBarItem(icon: Icon(Icons.business), label: "Business"),
    BottomNavigationBarItem(icon: Icon(Icons.sports), label: "Sports"),
    BottomNavigationBarItem(icon: Icon(Icons.science), label: "Science"),
    BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Setting"),
  ];
  List<Widget> screens = [
    BusinessScreen(),
    SportsScreen(),
    ScienceScreen(),
    SettingsScreen(),
  ];

  // void changeBottomNavBar(int index) {
  //   currentindex = index;
  //   emit(HomeBottomNavState());
  // }
  void changeBottomNavBar(int index) {
    if (index == 0) getBusiness();
    if (index == 1) getSports();
    if (index == 2) getScience();
    emit(HomeBottomNavState());
  }

  List<dynamic> science = [];

  void getScience() {
    emit(ScienceLoadingState());
    if (science.length == 0) {
      DioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          'country': 'eg',
          'category': 'science',
          'apiKey': '65f7f556ec76449fa7dc7c0069f040ca',
        },
      ).then((value) {
        //print(value.data['articles'][0]['title']);
        science = value.data['articles'];
        print(science[0]['title']);
        emit(ScienceSuccessState());
      }).catchError((error) {
        print(error.toString());
        emit(ScienceErrorState(error.toString()));
      });
    } else {
      emit(ScienceSuccessState());
    }
  }

  List<dynamic> sports = [];

  void getSports() {
    emit(SportsLoadingState());

    if (sports.length == 0) {
      DioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          'country': 'eg',
          'category': 'sports',
          'apiKey': '65f7f556ec76449fa7dc7c0069f040ca',
        },
      ).then((value) {
        //print(value.data['articles'][0]['title']);
        sports = value.data['articles'];
        print(sports[0]['title']);

        emit(SportsSuccessState());
      }).catchError((error) {
        print(error.toString());
        emit(SportsErrorState(error.toString()));
      });
    } else {
      emit(SportsSuccessState());
    }
  }

  List business = [];

  void getBusiness() {
    emit(BusinessLoadingState());
    DioHelper.getData(
      url: 'v2/top-headlines',
      query: {
        'country': 'eg',
        'category': 'business',
        'apiKey': '65f7f556ec76449fa7dc7c0069f040ca',
      },
    ).then((value) {
      business = value.data['article'];
      print(business[0]['title']);
      emit(BusinessSucessState());
    }).catchError((error) {
      print(error.toString());
      emit(BusinessErrorState(error.toString()));
    });
  }
}
