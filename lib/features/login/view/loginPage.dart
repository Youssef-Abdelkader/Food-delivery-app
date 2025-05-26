
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../data/DBHelper/dbhelper.dart';
import '../../../main.dart';
import '../../../utils/appImagesConstant.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String error = "";
  final DataBaseHelper _dbHelper = DataBaseHelper();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  List<Map<String, dynamic>> _users = [];
  Future<void> getUsers() async {
    _users = await _dbHelper.getUsers();

    String inputEmail = emailController.text.trim();
    String inputPassword = passwordController.text;

    bool found = false;

    for (var user in _users) {
      if (user['email'] == inputEmail) {
        if (user['password'] == inputPassword) {
          await setData(true);
          Navigator.pushNamed(context, "/home");
          found = true;
          break;
        } else {
          error = "password doesn't match";
          found = true;
          break;
        }
      }
    }

    if (!found) {
      error = "user not found";
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 250,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Color(0xFF202124), Color(0xFF191B2F)],
                    ),
                  ),
                ),
                backButton(),
                signUpTxt(),
                Positioned(
                  top: 38,
                  child: Image.asset(
                    AppImagesConstant().pizzaSignUp,
                    width: 448.6901881138669,
                    height: 448.6901881138669,
                  ),
                ),
              ],
            ),
            whiteContainer(context)
          ],
        ),
      ),
    );
  }

  Widget whiteContainer(BuildContext context){
    return Transform.translate(
        offset: Offset(0, -30),
        child: Container(
          padding: EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Email",
                style: TextStyle(
                  color: Color(0xff242731),
                  fontSize: 12,
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  hintText: "email",
                  fillColor: Colors.grey[100],
                  filled: true,
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Color(0xffFF6B57), width: 2),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 16),

              const SizedBox(height: 8),

              const Text(
                "Password",
                style: TextStyle(
                  color: Color(0xff242731),
                  fontSize: 12,
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: "your password",
                  suffixIcon: Icon(Icons.visibility_off),
                  fillColor: Colors.grey[100],
                  filled: true,
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Color(0xffFF6B57), width: 2),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 24),
      Text(error, style: TextStyle(color: Colors.red),),
              Container(
                alignment: Alignment.center,
                child: ElevatedButton(
                  onPressed: () {
                    getUsers();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xffFF6B57),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding: EdgeInsets.symmetric(
                      vertical: 16,
                      horizontal: 90,
                    ),
                  ),
                  child: Text(
                    "Login",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontFamily: "Poppins",
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),

              const Center(
                child: Text(
                  "Or Sign up with",
                  style: TextStyle(color: Color(0xffD3D1D8)),
                ),
              ),
              const SizedBox(height: 10),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  socialButton(
                    "FACEBOOK",
                    AppImagesConstant().faceBookIcon,
                  ),
                  const SizedBox(width: 16),
                  socialButton("GOOGLE", AppImagesConstant().googleIcon),
                ],
              ),

              const SizedBox(height: 10),
              Center(
                child: RichText(
                  text: const TextSpan(
                    text: "Already have an account? ",
                    style: TextStyle(color: Colors.black54),
                    children: [
                      TextSpan(
                        text: "Login",
                        style: TextStyle(color: Color(0xffFF6B57)),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),)
    );
  }

  Widget signUpTxt() {
    return Positioned(
      bottom: 40,
      left: 20,
      right: 200,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            "Sign Up",
            style: TextStyle(
              color: Colors.white,
              fontSize: 28,
              fontWeight: FontWeight.w700,
              fontFamily: "Poppins",
            ),
          ),
          SizedBox(height: 8),
          Text(
            "Please sign up to get started",
            style: TextStyle(
              color: Colors.white70,
              fontSize: 14,
              fontFamily: "Poppins",
            ),
          ),
        ],
      ),
    );
  }

  Widget backButton() {
    return Positioned(
      top: 60,
      left: 20,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        width: 38,
        height: 38,
        child: Image.asset(AppImagesConstant().backArrow),
      ),
    );
  }

  Widget socialButton(String label, String assetPath) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.white,
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 8, offset: Offset(0, 2)),
        ],
      ),
      child: Row(
        children: [
          Image.asset(assetPath, height: 24),
          const SizedBox(width: 10),
          Text(label),
        ],
      ),
    );
  }
}