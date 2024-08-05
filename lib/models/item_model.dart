import 'package:flutter/material.dart';
import 'package:fluttermidhackathon/models/category_models.dart';
import 'package:fluttermidhackathon/models/item_color_model.dart';

class ItemModel {
 final String title;
  final String id;
  final String thumbnaiul;
  final String discription;
  final int reviews;
  final double rate;
  final String subtitel;
  final double price;
  bool isFavorite;
  final CategoryModels Category;
  final bool isSelected; 
  final ItemColorModel colors;


  ItemModel(this.title, this.id, this.thumbnaiul, this.discription, this.reviews, this.rate, this.subtitel, this.price, this.Category, this.isSelected,this.isFavorite, this.colors);

}