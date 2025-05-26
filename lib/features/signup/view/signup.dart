import 'package:day1ui/utils/appImagesConstant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../data/DBHelper/dbhelper.dart';




class SignUpScreen extends StatefulWidget {
   SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final DataBaseHelper _dbHelper = DataBaseHelper();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();





  Future<void> insertUser(String name, String email, String password) async {
    Map<String, dynamic> userData = {
      'name': name,
      'email': email,
      'password': password,
    };
    int x = await _dbHelper.insertUser(userData);
    if(x!=0){
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("user inserted successfully")));

      print("user inserted");
    }else{
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("user not inserted")));
      print("user not inserted");
    }
  }

  @override
  void initState() {
    super.initState();
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
            "Full Name",
            style: TextStyle(
              color: Color(0xff242731),
              fontSize: 12,
              fontFamily: "Poppins",
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 8),
          TextField(
            controller: nameController,
            decoration: InputDecoration(
              hintText: "name",
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

          const Text(
            "E-Mail",
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
              hintText: "yourgmail@gmail.com",
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

          Container(
            alignment: Alignment.center,
            child: ElevatedButton(
              onPressed: () {
                insertUser(nameController.text, emailController.text, passwordController.text);
                Navigator.pushNamed(context, "/login");
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
                "Sign Up",
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
