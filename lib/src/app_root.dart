import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp2/bloc/news_cubit.dart';
import 'package:newsapp2/views/news_screen.dart';

class AppRoot extends StatelessWidget {
  final bool isDark;

  const AppRoot({required this.isDark});

  @override
  Widget build(BuildContext context) {
    var C1=Colors.black12;
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (BuildContext context) => NewsCubit()..getBusiness()..ChangeAppThememode(fromShared: isDark,)),
      ],
      child: BlocConsumer<NewsCubit, NewsState>(
        listener: (context, state) {
        },
        builder: (context, state) {
          var cubit=NewsCubit.get(context);
          return MaterialApp(
            theme: ThemeData(
              primarySwatch: Colors.deepOrange,
              scaffoldBackgroundColor: Colors.white,
              appBarTheme: AppBarTheme(
                  backgroundColor: Colors.white,
                  elevation: 0,
                  titleTextStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  iconTheme: IconThemeData(
                    color: Colors.black,
                  ),
                  systemOverlayStyle: SystemUiOverlayStyle(
                    statusBarColor: Colors.white,
                    statusBarIconBrightness: Brightness.dark,
                  )
              ),
              floatingActionButtonTheme: FloatingActionButtonThemeData(
                backgroundColor: Colors.deepOrange,
              ),
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                type: BottomNavigationBarType.fixed,
                selectedItemColor: Colors.deepOrange,
                elevation: 20,
              ),
              textTheme: TextTheme(
                bodyText1: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                  color: Colors.black,
                ),
              ),
            ),
            darkTheme: ThemeData(
              primarySwatch: Colors.deepOrange,
              scaffoldBackgroundColor: C1,
              appBarTheme: AppBarTheme(
                titleSpacing: 20,
                  backgroundColor: C1,
                  elevation: 0,
                  titleTextStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  iconTheme: IconThemeData(
                    color: Colors.white,
                  ),
                  systemOverlayStyle: SystemUiOverlayStyle(
                    statusBarColor: C1,
                    statusBarIconBrightness: Brightness.light,
                  )
              ),
              floatingActionButtonTheme: FloatingActionButtonThemeData(
                backgroundColor: Colors.deepOrange,
              ),
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                type: BottomNavigationBarType.fixed,
                selectedItemColor: Colors.deepOrange,
                unselectedItemColor: Colors.grey,
                elevation: 20,
                backgroundColor: C1,
              ),
              textTheme: TextTheme(
                bodyText1: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
            ),
            themeMode: cubit.isDark?ThemeMode.dark:ThemeMode.light,
            home: NewsScreen(),
            debugShowCheckedModeBanner: false,
          );
        },
      ),
    );
  }
}
