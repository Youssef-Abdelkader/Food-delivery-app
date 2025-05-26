import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../data/DBHelper/dbhelper.dart';
import '../../viewModel/cart_cubit.dart';
import 'mealItem.dart';

class MealListWidget extends StatefulWidget {
  final int quantity;


  MealListWidget({super.key, required this.quantity});

  @override
  State<MealListWidget> createState() => _MealListWidgetState();
}

class _MealListWidgetState extends State<MealListWidget> {
  late Future<List<Map<String, dynamic>>> _cartItems;
  // Future<void> deleteMeal(mealId) async {
  //   final dbHelper = DataBaseHelper();
  //   int x = await dbHelper.deleteMeal(mealId);
  // }

  // Future<List<Map<String, dynamic>>> getCartItems() async {
  //   final _dbHelper = DataBaseHelper();
  //   return await _dbHelper.getMeals();
  //
  // }

  @override
  void initState() {

    super.initState();
    context.read<CartCubit>().getMeals();
  }
  @override
  Widget build(BuildContext context) {
    return
      BlocBuilder<CartCubit, CartDataState>(
        builder: (context, state) {
          if (state.isLoading == true) {
            return Center(child: CircularProgressIndicator());
          }
          else if (state.meals != null) {
            return ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              padding: EdgeInsets.all(10),
              itemCount: state.meals!.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  width: 350,
                  margin: const EdgeInsets.only(bottom: 16),
                  child: MealItem(
                      meal: state.meals![index],
                      quantity: widget.quantity,
                      onDelete: () async{
                        // await deleteMeal(snapshot.data![index]['idMeal']);
                        // setState(() {
                        //   _cartItems = getCartItems();
                        // });
                        context.read<CartCubit>().deleteMeal(state.meals![index]['idMeal']);
                        context.read<CartCubit>().getMeals();
                      }
                  ),
                );
              },
            );

          }
          else if (state.isLoading == false && state.meals == null) {
            return Center(child: Text("Error"));
          }
          return Container();
        }
      );

    //   FutureBuilder(
    //   future: _cartItems,
    //   builder: (context, snapshot) {
    //     if (snapshot.connectionState == ConnectionState.waiting) {
    //       return Center(child: CircularProgressIndicator());
    //     } else if (snapshot.hasError) {
    //       return Center(child: Text('Error: ${snapshot.error}'));
    //     } else if (snapshot.hasData) {
    //   } else {
    //       return Center(child: Text("No data found"));
    //     }
    //   },
    // );
  }
}
