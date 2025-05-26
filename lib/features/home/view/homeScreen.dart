
import 'package:day1ui/features/home/view/widgets/OfferList.dart';
import 'package:day1ui/features/home/view/widgets/categoryList.dart';
import 'package:day1ui/features/home/view/widgets/restList.dart';
import 'package:day1ui/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../data/models/CategoryResponse.dart';



class HomeScreen extends StatefulWidget{
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<CategoryResponse> categoryResponse;


   String selectedCategory = "Chicken";
  void updateSelectedCategory(String category) {
    print("print Before update: $selectedCategory");
    setState(() {
      selectedCategory = category;
    });
    print("print After update: $selectedCategory");
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
       body:  SingleChildScrollView(
         child: Padding(
           padding: EdgeInsets.all(5.0),
           child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5)],
                      ),
                      child: IconButton( onPressed: () {
                        setData(false);
                        Navigator.pushNamed(context, "/signup");

                        }, icon: Icon(Icons.logout,color: Colors.black,),),
                    ),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Deliver to",
                          style: TextStyle(fontSize: 12, color: Colors.grey),
                        ),
                        Text(
                          "387  Merdina",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),

                    Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(25),
                          child:
                          Image.network(
                              "https://s3-alpha-sig.figma.com/img/229d/7689/81e5a087aea95ea91a8db95526009060?Expires=1745193600&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=pk91o3jJlUjjrzQzdGhznqumpn~CT6oTKauwQKTSWI90dKWDF~nIA~ThTzkbB1sYa6GPQqAfLNdDGLurLE2rfiqULaG8WWM7pRWJ2ZU6UZakk1qjHTWhOxErR8TKP4uMPJxsqaO9lkgLcHwMFBXnIEbAMvepxceTcmljMDhssM58BcMU7yj1ztgbbefWgqcAFeyKjeIZS2THxbJmCFQfrbdY8k6odcjwoho1MgIqHpoNHBgEtNrinimp7gGBbb1iR~cPJYsAPI8xB~pnkEHUX-bv7f~L6r24KhwqiXHS1VpIrmsj3ZzaTUImzLE5f2wvi-w-BiCeNeXUMrxT6jRJkQ__"
                          ,width: 50,
                          height: 50,
                          fit: BoxFit.cover,)
                        ),
                        Positioned(
                          top: 0,
                          right: 0,
                          child: Container(
                            padding: EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              color: Colors.orange,
                              shape: BoxShape.circle,
                            ),
                            child: Text(
                              "2",
                              style: TextStyle(fontSize: 10, color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                SizedBox(height: 20),

                ShaderMask(
                  shaderCallback: (bounds) => LinearGradient(
                    colors: [Color(0xffFD725C), Color(0xffFDC830)],
                  ).createShader(Rect.fromLTWH(0, 0, bounds.width, bounds.height)),
                  child: Text(
                    "Good Afternoon!",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Poppins",
                      color: Colors.white,
                    ),
                  ),
                ),

                SizedBox(height: 20),

                Container(
                  padding: EdgeInsets.symmetric(horizontal:15),
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10)],
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.search, color: Colors.grey),
                      SizedBox(width: 10),
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: "Search dishes, restaurants",
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                CategoryListWidget(onCategorySelected: updateSelectedCategory),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Special offers",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,fontFamily: "Poppins",color: Color(0xffFE724D),),),
                    InkWell(
                      onTap: (){
                        Navigator.pushNamed(context, "/offers");
                      },
                      child:
                      Text("View all", style: TextStyle(fontSize: 15,
                        fontFamily: "Poppins",
                        color: Color(0xffFE724D),),),
                    ),
             ],
                ),
                CategoryCards(selectedCategory: selectedCategory,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Restaurants",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,fontFamily: "Poppins",color: Color(0xffFE724D),),),
                    InkWell(
                      onTap: (){
                        Navigator.pushNamed(context, "/cart");
                      },
                      child:
                    Text("View all",style: TextStyle(fontSize: 15,fontFamily: "Poppins",color: Color(0xffFE724D),),),
                    ),
                      ],
                ),
                RestListWidget(),
                ]
            ),
         ),
       )


      ),
    );

  }
}

