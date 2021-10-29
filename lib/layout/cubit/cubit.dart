import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layout/cubit/states.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:news_app/modules/business/business_screen.dart';
import 'package:news_app/modules/health/health_screen.dart';
import 'package:news_app/modules/sclence/science_screen.dart';
import 'package:news_app/modules/sports/sports_screen.dart';
import 'package:news_app/modules/technology/technology_screen.dart';
import 'package:news_app/shared/network/remot/dio_helper.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(NewsInitialState());

  static NewsCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;
  List<BottomNavigationBarItem> bottomItems = [
    const BottomNavigationBarItem(
      icon: FaIcon(
        FontAwesomeIcons.briefcase,
      ),
      label: 'Business',
    ),
    const BottomNavigationBarItem(
      icon: FaIcon(
        FontAwesomeIcons.futbol,
      ),
      label: 'Sports',
    ),
    const BottomNavigationBarItem(
      icon: FaIcon(
        FontAwesomeIcons.brain,
      ),
      label: 'Science ',
    ),
  ];
  List<Widget> screens = [
    const BusinessScreen(),
    SportsScreen(),
    const ScienceScreen(),
    TechnologyScreen(),
    HealthScreen(),
  ];

  List<Widget> TabView = [
    const Tab(
      text: 'Business',
    ),
    const Tab(
      text: 'Sports',
    ),
    const Tab(
      text: 'Science',
    ),
    const Tab(
      text: 'Technology',
    ),
    const Tab(
      text: 'Health',
    ),

  ];

  void changed(int index) {
    currentIndex = index;
    if (index == 1) {
      getSports();
    }
    if (index == 2) {
      getScience();
    }
    emit(NewsButtonNavState());
  }

  List<dynamic> business = [];

  void getBusiness() {
    emit(NewsBusinessLoadingState());
    DioHelper.getData(
      url: 'v2/top-headlines',
      query: {
        'country': 'eg',
        'category': 'business',
        'apiKey': 'c1f52619b4b642d099d3a49f68940d5c',
      },
    ).then(
      (value) {
        business = value.data['articles'];
        // ignore: avoid_print
        print(business[0]['title']);
        emit(NewsBusinessSuccessState());
      },
    ).catchError(
      (e) {
        // ignore: avoid_print
        print(e.toString);
        emit(NewsBusinessErrorState(e.toString()));
      },
    );
  }

  List<dynamic> sports = [];

  void getSports() {
    if (sports.length == 0) {
      emit(NewsSportsLoadingState());
      DioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          'country': 'eg',
          'category': 'sports',
          'apiKey': 'c1f52619b4b642d099d3a49f68940d5c',
        },
      ).then(
        (value) {
          sports = value.data['articles'];
          // ignore: avoid_print
          print(sports[0]['title']);
          emit(NewsSportsSuccessState());
        },
      ).catchError(
        (e) {
          print(e.toString);
          emit(NewsSportsErrorState(e.toString()));
        },
      );
    } else {
      emit(NewsSportsSuccessState());
    }
  }

  List<dynamic> science = [];

  void getScience() {
    if (science.length == 0) {
      emit(NewsScienceLoadingState());
      DioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          'country': 'eg',
          'category': 'science',
          'apiKey': 'c1f52619b4b642d099d3a49f68940d5c',
        },
      ).then(
        (value) {
          science = value.data['articles'];
          // ignore: avoid_print
          print(science[0]['title']);
          emit(NewsScienceSuccessState());
        },
      ).catchError(
        (e) {
          print(e.toString);
          emit(NewsScienceErrorState(e.toString()));
        },
      );
    } else {
      emit(NewsScienceSuccessState());
    }
  }

  List<dynamic> technology = [];

  void getTechnology() {
    if (technology.length == 0) {
      emit(NewsTechnologyLoadingState());
      DioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          'country': 'eg',
          'category': 'technology',
          'apiKey': 'c1f52619b4b642d099d3a49f68940d5c',
        },
      ).then(
        (value) {
          technology = value.data['articles'];
          // ignore: avoid_print
          print(technology[0]['title']);
          emit(NewsTechnologySuccessState());
        },
      ).catchError(
        (e) {
          print(e.toString);
          emit(NewsTechnologyErrorState(e.toString()));
        },
      );
    } else {
      emit(NewsTechnologySuccessState());
    }
  }
  List<dynamic> health = [];

  void getHealth() {
    if (health.length == 0) {
      emit(NewsScienceLoadingState());
      DioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          'country': 'eg',
          'category': 'health',
          'apiKey': 'c1f52619b4b642d099d3a49f68940d5c',
        },
      ).then(
        (value) {
          health = value.data['articles'];
          // ignore: avoid_print
          print(health[0]['title']);
          emit(NewsHealthSuccessState());
        },
      ).catchError(
        (e) {
          print(e.toString);
          emit(NewsHealthErrorState(e.toString()));
        },
      );
    } else {
      emit(NewsHealthSuccessState());
    }
  }

  List<dynamic> search = [];

  void getSearch(String value) {
    emit(NewsSearchLoadingState());
    search = [];

    DioHelper.getData(
      url: 'v2/everything',
      query: {
        'q': "$value",
        'apiKey': 'c1f52619b4b642d099d3a49f68940d5c',
      },
    ).then(
      (value) {
        search = value.data['articles'];
        // ignore: avoid_print
        print(search[0]['title']);
        emit(NewsSearchSuccessState());
      },
    ).catchError(
      (e) {
        print(e.toString);
        emit(NewsSearchErrorState(e.toString()));
      },
    );
  }
}
