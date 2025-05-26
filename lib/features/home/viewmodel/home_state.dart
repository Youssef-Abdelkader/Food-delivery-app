part of 'home_cubit.dart';

// @immutable
// sealed class HomeState {}
// final class HomeInitial extends HomeState {}
// final class HomeLoadingCategories extends HomeState {}
// final class HomeLoadingMeals extends HomeState {
// }
// final class HomeLoadedCategories extends HomeState {
//   CategoryResponse categories;
//   HomeLoadedCategories(this.categories):super();
// }
// final class HomeLoadedMeals extends HomeState {
//    MealResponse meals;
//   HomeLoadedMeals(this.meals):super();
// }
// final class HomeErrorCategories extends HomeState {
//   String error;
//   HomeErrorCategories(this.error):super();
// }
// final class HomeErrorMeals extends HomeState {
//   String error;
//   HomeErrorMeals(this.error):super();
// }






class HomeDataState {
  MealResponse? meals;
  CategoryResponse? categories;
  bool ? isLoading;
  bool? isError;

  HomeDataState({required this.meals, required this.categories,  this.isLoading=false, this.isError=false});
  HomeDataState copyWith({
    MealResponse? meals,
    CategoryResponse? categories,
    bool? isLoading,
    bool? isError,
  }) {
    return HomeDataState(
      meals: meals ?? this.meals,
      categories: categories ?? this.categories,
      isLoading: isLoading ?? this.isLoading,
      isError: isError ?? this.isError,
    );
  }
}
