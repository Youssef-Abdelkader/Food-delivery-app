import 'package:flutter/material.dart';

import '../../../../data/models/meal.dart';




class OfferItemWidget extends StatelessWidget {
  OfferItemWidget({super.key, required this.mealObj});
  Meal mealObj;
  double rating = 3.1;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, "/details",arguments: mealObj);
      },
      child:
      Container(
        margin: EdgeInsets.all(10),
        width: 280,
      //  height: 800,
        decoration:  BoxDecoration(
            color: Color(0xffFE724D),
           borderRadius: BorderRadius.circular(15),
        ),
       child:
      Padding(
        padding:  EdgeInsets.all(10.0),
        child: Center(
          child: Row(
              children:[
                ClipRect(
                  clipBehavior: Clip.hardEdge,
                  child: Image.network(
                    mealObj.strMealThumb ?? "",
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,

                  ),
                ),

                SizedBox(height: 10,),
                Padding(
        padding: const EdgeInsets.all( 10),
            child: Column(
                  children: [

                    SizedBox(
                      width: 140,
                      child: Text(
                        mealObj.strMeal ?? "meal",
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),


                 ],
                ),
                )  ]),
        ),
      ),
       ),
    );
  }

}