import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../../../../data/models/MealResponse.dart';
import '../../../../data/services/network_service.dart';
import '../../viewmodel/home_cubit.dart';
import 'OfferItem.dart';


class CategoryCards extends StatefulWidget {
  final String selectedCategory;

  CategoryCards({super.key, required this.selectedCategory});

  @override
  State<CategoryCards> createState() => _CategoryCardsState();
}

class _CategoryCardsState extends State<CategoryCards> {
  late Future<MealResponse> mealResponse;

  @override
  void initState() {
    super.initState();
    fetchMeals();
  }
  @override
  void didUpdateWidget(CategoryCards oldWidget) {
    super.didUpdateWidget(oldWidget);
    print("print didUpdateWidget");
    if (oldWidget.selectedCategory != widget.selectedCategory) {
      print("print didUpdateWidgetn after if");
      fetchMeals();
    }
  }

  void fetchMeals() {
   context.read<HomeCubit>().getMeals(widget.selectedCategory);
  }


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeDataState>(
      builder: (context, state) {
        if (state.isLoading == true) {
          return Center(child: CircularProgressIndicator());
        } else if (state.meals != null) {
          return Container(
            height: 230,
            child: ListView.builder(
              physics: BouncingScrollPhysics(),
              padding: EdgeInsets.all(20),
              itemCount: state.meals?.meals.length ?? 0,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return OfferItemWidget(mealObj: state.meals!.meals[index]);
              },
            ),
          );
        } else if (state.isLoading == false && state.meals == null) {
          return Center(child: Text("Error"));
        }
        return Container();
      },
    );
  }
}