// ignore_for_file: avoid_print, prefer_const_constructors, prefer_is_empty
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layout/news_app/cubit/states.dart';

import '../../../modules/business/business_screen.dart';
import '../../../modules/science/science_screen.dart';
import '../../../modules/sports/sports.dart';
import '../../../shared/network/remote/dio_helper.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(NewInitialState());
  static NewsCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;
  List<BottomNavigationBarItem> bottomItems = [
    const BottomNavigationBarItem(
      icon: Icon(Icons.business_outlined),
      label: 'Business',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.sports),
      label: 'Sports',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.science_outlined),
      label: 'Science',
    ),
  ];
  void changeBottomNav(int index) {
    currentIndex = index;
    if (index == 1) {
      getSports();
    }
    if (index == 2) {
      getScience();
    }
    emit(NewBottomNavState());
  }

  List<Widget> screens = [
     BusinessScreen(),
     SportsScreen(),
     ScienceScreen(),
  ];

  List<dynamic> business = [];
  void getBusiness() {
    emit(NewGetBusinessLoadingState());
    if (business.length == 0) {
      Dio().get('https://newsapi.org/v2/top-headlines?country=eg&category=business&apiKey=9191a83c85aa457086af46fff8406428').then((value) {
        business = value.data['articles'];
        emit(NewGetBusinessSuccessState());
      }).catchError((error) {
        print(error.toString());
        emit(NewGetBusinessErrorState(error.toString()));
      });
    } else {
      emit(NewGetBusinessSuccessState());
    }
  }

  List<dynamic> sports = [];
  void getSports() {
    emit(NewGetSportsLoadingState());
    Dio().get('https://newsapi.org/v2/top-headlines?country=eg&sport=science&apiKey=9191a83c85aa457086af46fff8406428').then((value) {
      sports = value.data['articles'];
      print(sports[0]['title']);
      emit(NewGetSportsSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(NewGetSportsErrorState(error.toString()));
    });
      emit(NewGetSportsSuccessState());
  }

  List<dynamic> science = [];
  void getScience() {
    emit(NewGetScienceLoadingState());
    if (science.length == 0) {
      Dio().get('https://newsapi.org/v2/top-headlines?country=eg&category=science&apiKey=9191a83c85aa457086af46fff8406428').then((value) {
        print(value.data['articles'][0]['title']);
        science = value.data['articles'];
        print(science[0]['title']);
        emit(NewGetScienceSuccessState());
      }).catchError((error) {
        print(error.toString());
        emit(NewGetScienceErrorState(error.toString()));
      });
    } else {
      emit(NewGetScienceSuccessState());
    }
  }


  List<dynamic> search = [];

  void getSearch(String? value)
  {
    emit(NewGetSearchLoadingState());
    Dio().get('https://newsapi.org/v2/everything?q=$value&apiKey=9191a83c85aa457086af46fff8406428').then((value) {
      //print(value.data['articles'][0]['title']);
      search = value.data['articles'];
      print(search[0]['title']);

      emit(NewGetSearchSuccessState());
    }).catchError((error){
      print(error.toString());
      emit(NewGetSearchErrorState(error.toString()));
    });
  }
  bool isDark = false;
  Future<void> changeTheme(bool dark)async {
    isDark != dark;
  }
}
