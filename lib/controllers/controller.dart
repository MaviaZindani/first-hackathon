import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fluttermidhackathon/models/category_models.dart';
import 'package:fluttermidhackathon/models/item_color_model.dart';
import 'package:fluttermidhackathon/models/item_model.dart';

class Controller with ChangeNotifier {
  CategoryModels _category = CategoryModels.all;
  CategoryModels get category => _category;
  double subtotal = 0;
  double total = 0;
  double discount = 20;

  List<ItemModel> dataList = [
    ItemModel(
        'Leather Women Bag',
        '123',
        'assets/images/Image.png',
        'Maecenas cursus magna vitae convallis congue. Vestibulum dignissim augue odio, congue rutrum magna gravida ac. Sed rhoncus eu arcu a tempus.',
        230,
        23,
        'Unisex',
        599,
        CategoryModels.all,
        false,
        false,
        ItemColorModel([Colors.black, Colors.white, Colors.blue], 0),
        1),
    ItemModel(
        'Leather Women Bag',
        '123',
        'assets/images/Image.png',
        'Maecenas cursus magna vitae convallis congue. Vestibulum dignissim augue odio, congue rutrum magna gravida ac. Sed rhoncus eu arcu a tempus.',
        230,
        23,
        'Unisex',
        599,
        CategoryModels.cosmetic,
        false,
        false,
        ItemColorModel([Colors.black, Colors.white, Colors.blue], 0),
        1),
    ItemModel(
        'Leather Women Bag',
        '123',
        'assets/images/Image.png',
        'Maecenas cursus magna vitae convallis congue. Vestibulum dignissim augue odio, congue rutrum magna gravida ac. Sed rhoncus eu arcu a tempus.',
        230,
        23,
        'Unisex',
        599,
        CategoryModels.bag,
        false,
        false,
        ItemColorModel([Colors.black, Colors.white, Colors.blue], 0),
        1),
    ItemModel(
        'Leather Women Bag',
        '123',
        'assets/images/Image.png',
        'Maecenas cursus magna vitae convallis congue. Vestibulum dignissim augue odio, congue rutrum magna gravida ac. Sed rhoncus eu arcu a tempus.',
        230,
        23,
        'Unisex',
        599,
        CategoryModels.gift,
        false,
        false,
        ItemColorModel([Colors.black, Colors.white, Colors.blue], 0),
        1),
    ItemModel(
        'Leather Women Bag',
        '123',
        'assets/images/Image.png',
        'Maecenas cursus magna vitae convallis congue. Vestibulum dignissim augue odio, congue rutrum magna gravida ac. Sed rhoncus eu arcu a tempus.',
        230,
        23,
        'Unisex',
        599,
        CategoryModels.furniture,
        false,
        false,
        ItemColorModel([Colors.black, Colors.white, Colors.blue], 0),
        1),
  ];

  List offers = [];
  List<ItemModel> favrioteList = [];
  List<ItemModel> selectedItems = [];

  void addFavorite(ItemModel item) {
    item.isFavorite = true;
    favrioteList.add(item);
    notifyListeners();
  }

  void removeFromFavorite(ItemModel item) {
    item.isFavorite = false;
    favrioteList.remove(item);
    notifyListeners();
  }

  void addToChackout(ItemModel item) {
    selectedItems.add(item);
    notifyListeners();
  }

  void addAllToChackout(List<ItemModel> items) {
    selectedItems.addAll(items);
    notifyListeners();
  }

  void changeCategory(CategoryModels category) {
    _category = category;
    notifyListeners();
  }

  void subTotalFunc(ItemModel item) {
    subtotal += item.price;
    notifyListeners();
  }

  void subtractTotalFunc(ItemModel item) {
    subtotal -= item.price;
    notifyListeners();
  }

  void totalFunc() {
    // double totalDicount = 100 - discount;
   double nam = (subtotal * discount) / 100;
   total = subtotal - nam;
    // total + (num * totalDicount);
    notifyListeners();
  }

  void addNumberOfProduct(ItemModel item) {
    item.numberOfProduct++;
    notifyListeners();
  }

  void removeNumberOfProdect(ItemModel item) {
    if (item.numberOfProduct > 0) {
      item.numberOfProduct--;
      notifyListeners();
    }
  }

  void clearList(){
    selectedItems.clear();
    notifyListeners();
  }

  List buildgetitemlist(
    BuildContext context,
  ) {
    var provider = Provider.of<Controller>(context, listen: true);
    if (category == CategoryModels.all) {
      return provider.dataList;
    } else {
      return provider.dataList
          .where((itemModel) => itemModel.Category == category)
          .toList();
    }
  }
}
