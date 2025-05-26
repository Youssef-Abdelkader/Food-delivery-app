part of 'details_cubit.dart';


class DetailsDataState {
  Meal? meal;
  bool ? isLoading;
  bool? isError;
  bool? isAdded;

  DetailsDataState({required this.meal, this.isLoading=false, this.isError=false, this.isAdded=false});
  DetailsDataState copyWith({
    Meal? meal,
    bool? isLoading,
    bool? isError,
    bool? isAdded,
  }) {
    return DetailsDataState(
      meal: meal ?? this.meal,
      isLoading: isLoading ?? this.isLoading,
      isError: isError ?? this.isError,
      isAdded: isAdded ?? this.isAdded,
    );
  }
}