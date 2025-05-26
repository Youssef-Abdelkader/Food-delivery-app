import 'package:day1ui/utils/appImagesConstant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/meal.dart';
import '../viewmodel/details_cubit.dart';



class FoodDetailsScreen extends StatefulWidget {
  final Meal meal;


  FoodDetailsScreen({super.key, required this.meal});

  @override
  State<FoodDetailsScreen> createState() => _FoodDetailsScreenState();
}

class _FoodDetailsScreenState extends State<FoodDetailsScreen> {
  late Future<Meal> mealInfo;


  @override
  void initState() {
    super.initState();
  //  mealInfo = MealsService.getMealDetails(widget.meal.idMeal);
    context.read<DetailsCubit>().getMealsDetails(widget.meal.idMeal);

  }


  List<Map<String, String>> getIngredients(Meal meal) {
    final ingredients = <Map<String, String>>[];

    for (int i = 1; i <= 20; i++) {
      final ingredient = meal.toJson()['strIngredient$i']?.trim();
      final measure = meal.toJson()['strMeasure$i']?.trim();

      if (ingredient != null && ingredient.isNotEmpty && ingredient.toLowerCase() != "null") {
        ingredients.add({
          "ingredient": ingredient,
          "measure": measure ?? "",
        });
        print(ingredient);
        print(measure);
      }
    }

    return ingredients;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DetailsCubit, DetailsDataState>(
      builder: (context, state) {
        if (state.isLoading == true) {
          return Center(child: CircularProgressIndicator());
        }
        else if (state.meal != null) {
          final meal = state.meal!;
          final ingredientList = getIngredients(meal);
          return Scaffold(
            backgroundColor: Colors.white,
            body: Stack(
              children: [
                SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          Image.network(
                            meal.strMealThumb ?? "",
                            width: double.infinity,
                            height: 280,
                            fit: BoxFit.cover,
                          ),
                          backButton(),
                          Positioned(
                            top: 60,
                            right: 16,
                            child: Icon(Icons.favorite_border_rounded, color: Color(0xffFF6B57)),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(meal.strMeal ?? "",
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18)),
                              ],
                            ),
                            SizedBox(height: 8),
                            Row(
                              children: [
                                Icon(Icons.local_shipping, color: Color(0xffFF6B57), size: 16),
                                SizedBox(width: 4),
                                Text("Free delivery"),
                                SizedBox(width: 12),
                                Icon(Icons.access_time, color: Color(0xffFF6B57), size: 16),
                                SizedBox(width: 4),
                                Text("45 mins"),
                                SizedBox(width: 12),
                                Icon(Icons.star, size: 16, color: Colors.amber),
                                SizedBox(width: 4),
                                Text("4.5"),
                              ],
                            ),
                            SizedBox(height: 12),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Color(0xFF1C1C2D),
                          borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Topping for you",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold)),
                            SizedBox(height: 16),
                            ...ingredientList.map((item) => toppingItem(
                              item['ingredient'] ?? "",
                              item['measure'] ?? "",
                            )).toList(),
                            SizedBox(height: 80),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: QuantitySelector(meal: meal))
              ],
            ),
          );

        }else if (state.isLoading == false && state.meal == null) {
          return Center(child: Text("Error"));
        }else if (state.isAdded == true) {
          return Center(child: Text("Added"));
        }
        else {
          return Container();
        }
      }
    );

    // return FutureBuilder<Meal>(
    //   future: mealInfo,
    //   builder: (context, snapshot) {
    //     if (snapshot.connectionState == ConnectionState.waiting) {
    //       return Center(child: CircularProgressIndicator());
    //     } else if (snapshot.hasError) {
    //       return Center(child: Text('Error: ${snapshot.error}'));
    //     } else if (snapshot.hasData) {
    //       final meal = snapshot.data!;
    //       final ingredientList = getIngredients(meal);
    //       print("Ingredients: $ingredientList");
    //
    //   } else {
    //       return Center(child: Text('No meal details available'));
    //     }
    //   },
    // );
  }

  Widget toppingItem(String ingredient, String measure) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Icon(Icons.local_dining, color: Colors.orangeAccent),
          SizedBox(width: 12),
          Expanded(
            child: Text(
              "$ingredient - $measure",
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
          Icon(Icons.radio_button_off, color: Colors.grey),
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
          color: Color(0xffFF6B57),
          borderRadius: BorderRadius.circular(10),
        ),
        width: 38,
        height: 38,
        child: Image.asset(AppImagesConstant().backArrow),
      ),
    );
  }
}


class QuantitySelector extends StatefulWidget {
  Meal meal;
   QuantitySelector({super.key, required this.meal});

  @override
  State<QuantitySelector> createState() => _QuantitySelectorState();
}

class _QuantitySelectorState extends State<QuantitySelector> {
  int quantity = 1;
  double pricePerItem = 11.17;

  Future<void> insertMeal(Meal meal) async {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Adding meal to basket...'),
        duration: Duration(seconds: 1),
      ),
    );
    int x = await context.read<DetailsCubit>().addMeal(meal);
    if (x > 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Meal added to basket'),
          duration: Duration(seconds: 1),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to add meal to basket'),
          duration: Duration(seconds: 1),
        ));
    }
  }
  @override
  Widget build(BuildContext context) {
    double totalPrice = quantity * pricePerItem;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              InkWell(
                onTap: () {
                  setState(() {
                    if (quantity > 1) quantity--;
                  });
                },
                child: Icon(Icons.remove, color: Colors.white),
              ),
              SizedBox(width: 12),
              Text("$quantity", style: TextStyle(color: Colors.white)),
              SizedBox(width: 12),
              InkWell(
                onTap: () {
                  setState(() {
                    quantity++;
                  });
                },
                child: Icon(Icons.add, color: Colors.white),
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () {
              print("add to basket ${widget.meal.strMeal}");
              insertMeal(widget.meal);
                Navigator.pushNamed(context, "/cart");
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xffFF6B57),
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
              ),
            ),
            child: Text(
              "Add $quantity to basket  \$${totalPrice.toString()}",
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }

}

