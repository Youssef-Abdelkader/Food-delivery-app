import 'package:bloc/bloc.dart';
import 'package:day1ui/data/services/network_service.dart';
import 'package:meta/meta.dart';

import '../../../data/models/MealResponse.dart';
import '../../../data/models/meal.dart';
import '../../../data/repo/repo.dart';

part 'details_state.dart';

class DetailsCubit extends Cubit<DetailsDataState> {
  final Repo repo;
  DetailsCubit(this.repo) : super(DetailsDataState(meal: null));
  Future<void> getMealsDetails(String mealId) async {
    emit(state.copyWith(isLoading: true));
    try {
      final meal = await repo.getMealDetails(mealId);
      emit(state.copyWith(meal: meal,isLoading: false));
    } catch (e) {
      emit(state.copyWith(isLoading: false));
    }
  }
  Future<int> addMeal(Meal mealObj) async {
    emit(state.copyWith(isLoading: true));
    int x = 0;
    try {
      final mealData = mealObj.toJson();
      x = await repo.addMeal(mealData);
      emit(state.copyWith(isAdded: true,isLoading: false));
    } catch (e) {
      emit(state.copyWith(isLoading: false,isAdded: false));
    }
    return x;

  }

}
