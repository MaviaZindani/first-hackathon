import 'package:fluttermidhackathon/models/item_model.dart';

class ProductScreenArgument {
  final ItemModel _itemModel;
  ProductScreenArgument(this._itemModel);
  ItemModel get itemModel => _itemModel;
}