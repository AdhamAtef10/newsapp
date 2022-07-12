import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:newsapp2/services/dio/dio_services.dart';
import 'package:newsapp2/services/shearedprefrence/shearedprefrence_services.dart';
import 'package:newsapp2/views/business_screen.dart';
import 'package:newsapp2/views/science_screen.dart';
import 'package:newsapp2/views/sports_screen.dart';

part 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {

  NewsCubit() : super(NewsInitial());
  static NewsCubit get(context)=>BlocProvider.of(context);
  int currentIndex=0;
  List<BottomNavigationBarItem> bottomItems=
  [
    BottomNavigationBarItem(
        icon: Icon(
          Icons.business,
        ),
      label: 'Business'
    ),
    BottomNavigationBarItem(
        icon: Icon(
          Icons.sports,
        ),
      label: 'Sports',
    ),
    BottomNavigationBarItem(
        icon: Icon(
          Icons.science,
        ),
      label: 'Science',
    ),
  ];


  List<Widget>Screens=[
  BusinessScreen(),
  SportsScreen(),
  ScienceScreen(),
  ];

  void changeBottomNavBar(int index)
  {
    currentIndex=index;
    if(index==1)
      getSports();
    if(index==2)
      getScience();
    emit(NewsBottomNavState());
  }
   List<dynamic>business=[];
  void getBusiness()
  {
    emit(NewsBusinessLoadingState());
    DioHelper.getData(
      url:'v2/top-headlines',
      query:{
        'country':'eg',
        'category':'business',
        'apiKey':'67f7227eb9b04a098120070a6f02480f',
      },
    ).then((value)
    {
      business=value.data['articles'];
      print(business[0]['title']);
      emit(NewsGetBusinessSuccessState());
    }).catchError((error){
      print(error.toString());
      emit(NewsGetBusinessErrorState(error.toString()));
    });
  }


  List<dynamic>sports=[];
  void getSports()
  {
    emit(NewsSportsLoadingState());

    if(sports.length==0)
      {
        DioHelper.getData(
          url:'v2/top-headlines',
          query:{
            'country':'eg',
            'category':'sports',
            'apiKey':'67f7227eb9b04a098120070a6f02480f',
          },
        ).then((value)
        {
          sports=value.data['articles'];
          print(sports[0]['title']);

          emit(NewsGetSportsSuccessState());
        }).catchError((error){
          print(error.toString());
          emit(NewsGetSportsErrorState(error.toString()));
        });
      }else
        {
          emit(NewsGetSportsSuccessState());
        }
  }

  List<dynamic>science=[];
  void getScience()
  {
    emit(NewsScienceLoadingState());

    if(science.length==0)
      {
        DioHelper.getData(
          url:'v2/top-headlines',
          query:{
            'country':'eg',
            'category':'science',
            'apiKey':'67f7227eb9b04a098120070a6f02480f',
          },
        ).then((value)
        {
          science=value.data['articles'];
          print(science[0]['title']);
          emit(NewsGetScienceSuccessState());

        }).catchError((error){
          print(error.toString());
          emit(NewsGetScienceErrorState(error.toString()));
        });
      }else
        {
          emit(NewsGetScienceSuccessState());
        }
  }
  List<dynamic> search=[];
  void getSearch(String value) {

    emit(NewsGetSearchLoadingState());
    search=[];
    DioHelper.getData(
      url:'v2/everything',
      query:{
        'q':'$value',
        'apiKey':'67f7227eb9b04a098120070a6f02480f',
      },
    ).then((value) {
      search=value.data['articles'];
      print(search[0]['title']);
      emit(NewsGetSearchSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(NewsGetSearchErrorState(error.toString()));
    });
  }

  bool isDark=false;
  void ChangeAppThememode({ bool? fromShared})
  {
    if(fromShared!=null)
      isDark=fromShared;
    else
    isDark=!isDark;
    CacheHelper.putBoolean(key: 'isDark', value: isDark).then((value)
    {
      emit(AppChangeThemeState());
    });
  }
}
