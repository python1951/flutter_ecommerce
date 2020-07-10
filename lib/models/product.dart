import 'package:flutter/material.dart';

class Product {
  final String title;
  final String description;
  final double price;
  final String image;
  final bool isFavourite;
  final String email;
  final String id;
  Product(
      {@required this.title,
      @required this.description,
      @required this.price,
      @required this.image,
      @required this.email,
      @required this.id,
      this.isFavourite = false});
}
