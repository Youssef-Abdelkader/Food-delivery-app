import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/models/meal.dart';
import '../../../data/repo/repo.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartDataState> {
  Repo repo;
  CartCubit(this.repo) : super(CartDataState(meals: null));
  Future<void> getMeals() async {
    emit(state.copyWith(isLoading: true));
    try {
      final meals = await repo.getMealsLocal();
      emit(state.copyWith(meals: meals, isLoading: false));
    } catch (e) {
      emit(state.copyWith(isLoading: false, isError: true));
    }
  }
Future<void> deleteMeal(mealId) async {
    try {
      await repo.deleteMeal(mealId);
    emit(state.copyWith(isDeleted: true));
    } catch (e) {
      emit(state.copyWith(isDeleted: false, isError: true));
    }
}

}
