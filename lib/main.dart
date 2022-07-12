import 'package:flutter/cupertino.dart';
import 'package:newsapp2/services/dio/dio_services.dart';
import 'package:newsapp2/services/shearedprefrence/shearedprefrence_services.dart';
import 'package:newsapp2/src/app_root.dart';

void main()async
{
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  bool? isDark=CacheHelper.getBoolean(key:'isDark');
  DioHelper.init();
runApp(AppRoot(isDark: isDark!));
}