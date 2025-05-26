import 'package:day1ui/utils/AppRoute.dart';
import 'package:day1ui/utils/appImagesConstant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';



class SplashScreen extends StatefulWidget{
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
      checkLoginStatus();
  }
  Future<void> checkLoginStatus() async {
    final pref = await SharedPreferences.getInstance();
    final isLogin = pref.getBool("isLogin") ?? false;

    if (isLogin) {
      Navigator.pushReplacementNamed(context, AppRoute.home);
    } else {
      Navigator.pushReplacementNamed(context, AppRoute.signup);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      GestureDetector(
        onTap: (){
          Navigator.pushNamed(context, "/onboard");
        },
        child: Container(

          color: Color(0xffFF6B57),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child:
            Image.asset(AppImagesConstant().topSplash),
            ),
            SvgPicture.asset(
              AppImagesConstant().iconSVG,
              width: 188,
              height: 188,
            ),
            Text("Comida",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                  fontFamily: "Righteous",
                  letterSpacing: 0,
                  fontWeight: FontWeight.w400,
                  height: 50/40
            ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: ClipRect(
                child: SizedBox(
                  width: 223,
                  child: Image.asset(
                    AppImagesConstant().bottomSplash,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            )


          ]
          ),
            ),
      )
    );
  }
}