import 'package:bloc/bloc.dart';
import 'package:day1ui/data/models/MealResponse.dart';
import 'package:day1ui/data/repo/repo.dart';
import 'package:meta/meta.dart';

import '../../../data/models/CategoryResponse.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeDataState> {
  final Repo repo;
  HomeCubit(this.repo) : super(HomeDataState(meals: null, categories: null, isLoading: false));
  Future<void> getCategories() async {
    emit(state.copyWith(isLoading: true));
    try {
      final categories = await repo.getCategories();

      emit( state.copyWith(categories: categories,isLoading: false));
    } catch (e) {
      emit(state.copyWith(isLoading: false));
    }
  }
  Future<void> getMeals(String categoryName) async {
    emit(state.copyWith(isLoading: true));
    try {
      final meals = await repo.getMealsRemote(categoryName);
      emit(state.copyWith(meals: meals,isLoading: false));
      print("in getMeals() cubit ${meals}");
    } catch (e) {
      emit(state.copyWith(isLoading: false));
    }
  }
}
