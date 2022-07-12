import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp2/bloc/news_cubit.dart';
import 'package:newsapp2/core/utlis.dart';
import 'package:newsapp2/services/dio/dio_services.dart';
import 'package:newsapp2/views/search_screen.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit=NewsCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'News App',
            ),
            actions: [
              IconButton(
                  onPressed: (){
                    AppNavigator.customNavigator(
                        context: context,
                        screen: SearchScreen(),
                        finish: false,
                    );
                  }
                  , icon: Icon(
                Icons.search,
              ),
              ),
              IconButton(
                onPressed: ()
                {
                  cubit.ChangeAppThememode();
                }
                , icon: Icon(
                Icons.brightness_4_outlined,
              ),
              ),
            ],
          ),
          body: cubit.Screens[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: cubit.currentIndex,
            onTap: (index)
            {
              cubit.changeBottomNavBar(index);
            },
            items: cubit.bottomItems,
          ),
        );
      },
    );
  }
}
