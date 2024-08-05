import 'package:flutter/material.dart';
import 'package:fluttermidhackathon/models/category_models.dart';
import 'package:fluttermidhackathon/models/item_color_model.dart';
import 'package:fluttermidhackathon/models/item_model.dart';

class Controller with ChangeNotifier {
  List<ItemModel> dataList = [
    ItemModel('Leather Women Bag', '123', 'assets/images/Image.png', 'Maecenas cursus magna vitae convallis congue. Vestibulum dignissim augue odio, congue rutrum magna gravida ac. Sed rhoncus eu arcu a tempus.', 230, 23, 'Unisex',
        599, CategoryModels.all, false, false, ItemColorModel([Colors.black,Colors.white,Colors.blue], 0)),

            ItemModel('Leather Women Bag', '123', 'assets/images/Image.png', 'Maecenas cursus magna vitae convallis congue. Vestibulum dignissim augue odio, congue rutrum magna gravida ac. Sed rhoncus eu arcu a tempus.', 230, 23, 'Unisex',
        599, CategoryModels.cosmetic, false, false, ItemColorModel([Colors.black,Colors.white,Colors.blue], 0)),
        
  ];

  List offers = [];

  List selectedItems = [];
}
