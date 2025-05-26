import 'package:flutter/material.dart';

import '../../../../data/models/restaurantsModel.dart';


class RestItemWidget extends StatelessWidget {
  RestItemWidget({super.key, required this.restaurant});
  RestaurantsModel restaurant;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280,
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8,
            offset: Offset(0, 4),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                child: Image.network(
                  restaurant.image,
                  height: 180,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 10,
                right: 10,
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: IconButton(color: Colors.red, onPressed: () {  }, icon: Icon(Icons.favorite_border),),
                ),
              ),
            ],
          ),

          Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(restaurant.name,
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Poppins")),
                    Row(
                      children: [
                        Icon(Icons.star, color: Colors.amber, size: 16),
                        SizedBox(width: 3),
                        Text(restaurant.rating.toString(),
                            style: TextStyle(
                                fontSize: 14, fontFamily: "Poppins")),
                      ],
                    ),
                  ],
                ),

                SizedBox(height: 8),

                Row(
                  children: [
                    Icon(Icons.delivery_dining,
                        color: Colors.redAccent, size: 18),
                    SizedBox(width: 4),
                    Text("${restaurant.delevery} Delivery",
                        style: TextStyle(
                            fontSize: 13, color: Colors.grey.shade700)),

                    SizedBox(width: 15),

                    Icon(Icons.access_time, color: Colors.redAccent, size: 18),
                    SizedBox(width: 4),
                    Text("${restaurant.time} mins",
                        style: TextStyle(
                            fontSize: 13, color: Colors.grey.shade700)),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

}