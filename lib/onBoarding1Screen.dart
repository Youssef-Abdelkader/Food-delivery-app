import 'package:day1ui/utils/appImagesConstant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
    Widget build(BuildContext context) {
      return Scaffold(
        body: Container(
          color: const Color(0xffFF6B57),
          width: double.infinity,
          height: double.infinity,
          child: Stack(
            fit: StackFit.expand,
            children: [
              Positioned(
                top: 0,
                right: 0,
                child: Image.asset(
                  AppImagesConstant().onBoardingScreenImage,
                  width: MediaQuery.of(context).size.width * 0.9,
                  fit: BoxFit.cover,
                ),
              ),
             SizedBox(height: 100),
              Padding(
                padding: const  EdgeInsets.only(top: 300),
                child: Image.asset(
                  AppImagesConstant().foreground,
                  width: 397.88717651367335,
                  height: 300,
                  fit: BoxFit.contain,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 24.0,top: 430),
                    child: Text(
                      "I don't feel like cooking. Let's order food delivery.",
                      style: TextStyle(
                        color: const Color(0xff242731),
                        fontSize: 36,
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),



                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0,vertical: 35),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            // ScaffoldMessenger.of(context).showSnackBar(
                            //   const SnackBar(content: Text("Sign Up clicked")),
                              Navigator.pushNamed(context, "/signup");
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black,
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(vertical: 16,horizontal: 40),
                          ),
                          child: const Text("Sign Up"),
                        ),

                        const SizedBox(width: 16),

                        ElevatedButton(
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text("Log in clicked")),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white.withOpacity(0.21),
                            foregroundColor: Colors.white,
                            side: const BorderSide(color: Colors.white),
                            padding: const EdgeInsets.symmetric(vertical: 16,horizontal: 40),
                          ),
                          child: const Text("Log in"),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    }


}