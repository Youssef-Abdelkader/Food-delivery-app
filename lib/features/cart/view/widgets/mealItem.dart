import 'package:flutter/material.dart';

import '../../../../data/DBHelper/dbhelper.dart';




class MealItem extends StatefulWidget {
  int quantity = 1;
  final VoidCallback onDelete;
  Map<String, dynamic> meal;
  MealItem({super.key, required this.meal,required this.quantity, required this.onDelete});

  @override
  State<MealItem> createState() => _MealItemState();
}

class _MealItemState extends State<MealItem> {

Future<void> deleteMeal() async {
  final dbHelper = DataBaseHelper();
  int x = await dbHelper.deleteMeal(widget.meal['idMeal']);
  if (x > 0) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Meal deleted from basket'),
        duration: Duration(seconds: 1),
          ),
    );
  } else {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Failed to delete meal from basket'),
        duration: Duration(seconds: 1),
      ),
    );
  }
}
  @override
  Widget build(BuildContext context) {
    return Container(
     // color: Colors.amber,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey),
      ),
    //  margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      child: Row(

        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(widget.meal['strMealThumb'] ?? "", width: 50, height: 50, fit: BoxFit.cover),
          ),
          const SizedBox(width: 10),
         Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.meal['strMeal'] ?? "", style: const TextStyle(fontWeight: FontWeight.bold)),
             //   Text("\$${widget.meal.strMeal ?? " "}" );

              ],
            ),
         ),
          IconButton(onPressed: (){
            widget.onDelete();
          }, icon: const Icon(Icons.remove_circle_outline)),
          Text(widget.quantity.toString()),
          //IconButton(onPressed: (){}, icon: const Icon(Icons.add_circle_outline)),
        //  IconButton(onPressed: (){}, icon: const Icon(Icons.close)),

        ],
      ),
    );
  }
}
