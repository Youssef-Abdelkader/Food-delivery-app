import 'dart:ui';

class OffersModel {
  final String image;
  final String categoryName;
  final double price;
  final String description;
  final Color color;
  final String delevery;
  final double rating;
  const OffersModel({required this.image, required this.categoryName, required this.price, required this.description, required this.color, required this.delevery,required this.rating});
}