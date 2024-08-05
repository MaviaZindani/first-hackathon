
import 'package:flutter/material.dart';
import 'package:fluttermidhackathon/models/category_models.dart';

class CategoryChangeNotifier extends ChangeNotifier {
  CategoryModels _category = CategoryModels.all;
   CategoryModels get category => _category;

  void changeCategory( CategoryModels category) {
    _category = category;
    notifyListeners();
  }
}