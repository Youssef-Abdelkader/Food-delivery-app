import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../../../../data/models/CategoryResponse.dart';
import '../../../../data/services/network_service.dart';
import '../../viewmodel/home_cubit.dart';
import 'categoryItem.dart';
class CategoryListWidget extends StatefulWidget {
  final Function(String) onCategorySelected;

  CategoryListWidget({super.key, required this.onCategorySelected});

  @override
  State<CategoryListWidget> createState() => _CategoryListWidgetState();
}
class _CategoryListWidgetState extends State<CategoryListWidget> {
  late Future<CategoryResponse> categoryResponse;
   String selectedCategory = "Chicken" ;

  @override
  void initState() {
    super.initState();
    context.read<HomeCubit>().getCategories();
  }

  @override
  Widget build(BuildContext context) {
    return
    BlocBuilder
      <HomeCubit, HomeDataState>(
      builder: (context, state) {

        if (state.isLoading == true) {
          return Center(child: CircularProgressIndicator());
        } else if (state.categories != null) {

          return Container(
            height: 150,
            child: ListView.builder(
                  padding: EdgeInsets.all(20),
                  itemCount: state.categories?.categories.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    var category =state.categories?.categories[index];
                    return CategoryItemWidget(
                      category: category!!,
                      onTap: () {
                        print("print Category selected in list: ${category.strCategory}");

                        widget.onCategorySelected(category.strCategory);
                      },);
                  }
                    ),
          );
        }else if (state.isLoading == false && state.categories == null) {
          return Center(child: Text("Error"));
        }

        return Container();
      }
    );

  }
}

