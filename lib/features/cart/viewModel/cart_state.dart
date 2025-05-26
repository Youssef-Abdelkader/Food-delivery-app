part of 'cart_cubit.dart';

class CartDataState {
  List<Map<String, dynamic>>? meals;
  bool ? isLoading;
  bool? isError;
  bool? isDeleted;

  CartDataState({required this.meals, this.isLoading=false, this.isError=false, this.isDeleted=false});
  CartDataState copyWith({
    List<Map<String, dynamic>>? meals,
    bool? isLoading,
    bool? isError,
    bool? isDeleted,
  }) {
    return CartDataState(
      meals: meals ?? this.meals,
      isLoading: isLoading ?? this.isLoading,
      isError: isError ?? this.isError,
      isDeleted: isDeleted ?? this.isDeleted,
    );
  }
}
