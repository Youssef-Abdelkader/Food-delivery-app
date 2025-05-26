import 'package:day1ui/onBoarding1Screen.dart';
import 'package:day1ui/splashScreen.dart';
import 'package:day1ui/utils/AppRoute.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'data/DBHelper/dbhelper.dart';
import 'data/models/meal.dart';
import 'data/repo/repo.dart';
import 'data/services/network_service.dart';
import 'features/cart/view/cartScreen.dart';
import 'features/cart/viewModel/cart_cubit.dart';
import 'features/details/view/detailsScreen.dart';
import 'features/details/viewmodel/details_cubit.dart';
import 'features/home/view/homeScreen.dart';
import 'features/home/viewmodel/home_cubit.dart';
import 'features/login/view/loginPage.dart';
import 'features/signup/view/signup.dart';

class RouteGenerator{
  static Route generateRoute(RouteSettings settings){
    switch(settings.name){
      case AppRoute.on_board:
          return MaterialPageRoute(builder: (context)=> OnBoardingScreen());
        case AppRoute.signup:
        return MaterialPageRoute(builder: (context)=> SignUpScreen());
      case AppRoute.details:
        final meal = settings.arguments as Meal;
        return MaterialPageRoute(builder: (context)=>
            BlocProvider(create: (_)=> DetailsCubit(Repo(newsService: MealsService(), dbHelper: DataBaseHelper())),child: FoodDetailsScreen(meal: meal)));
        case AppRoute.splash:
          return MaterialPageRoute(builder: (context)=> SplashScreen());
          case AppRoute.home:
          return MaterialPageRoute(builder: (context)=> BlocProvider(create: (_)=> HomeCubit(Repo(newsService: MealsService(), dbHelper: DataBaseHelper())),child: HomeScreen()));
          case AppRoute.cart:
            return MaterialPageRoute(builder: (context)=>
                BlocProvider(create: (_)=> CartCubit(Repo(newsService: MealsService(), dbHelper: DataBaseHelper())),child: CartScreen()));
            case AppRoute.login:
              return MaterialPageRoute(builder: (context)=> LoginScreen());


      default:
        return MaterialPageRoute(builder: (context){
          return Scaffold(
            body: Center(
              child: Text("No route found"),
            ),
          );
        });
    }

  }
}