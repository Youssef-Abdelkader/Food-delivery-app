import 'package:day1ui/onBoarding1Screen.dart';
import 'package:day1ui/route_generator.dart';
import 'package:day1ui/splashScreen.dart';
import 'package:day1ui/utils/AppRoute.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'features/details/view/detailsScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: AppRoute.home,
      onGenerateRoute: RouteGenerator.generateRoute,
      debugShowCheckedModeBanner: false,
    //  home:  SplashScreen(),
    );
  }
}

setData(bool value) async {
  final pref = await SharedPreferences.getInstance();
  pref.setBool("isLogin", value);
}
