import 'package:flutter/material.dart';
import 'package:fluttermidhackathon/components.dart';
import 'package:fluttermidhackathon/controllers/controller.dart';
import 'package:fluttermidhackathon/models/category_models.dart';
import 'package:fluttermidhackathon/models/item_model.dart';
import 'package:fluttermidhackathon/notifiyr.dart/category_change_notifier.dart';
import 'package:fluttermidhackathon/widgets/item_box.dart';
import 'package:provider/provider.dart';

class FavrioteScreen extends StatelessWidget {
  final ItemModel itemModel;
  const FavrioteScreen({super.key, required this.itemModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: e_themeColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text('Popular Product'),
        centerTitle: true,
        actions: const [Stack(
          alignment: Alignment.topRight,
          children: [
            Icon(Icons.shopping_basket),
            CircleAvatar(
              backgroundColor: Colors.red,
              radius: 2,
            )
          ],
        )],
      ),
      body: Column(
        
      ),
    );
  }

  Widget _category(BuildContext context) {
    var provider = Provider.of<Controller>(context, listen: false);
    Provider.of<CategoryChangeNotifier>(context).category;
    return SizedBox(
      height: 74,
      width: double.maxFinite,
      child: Column(
        children: [
           SizedBox(
            height: 10,
          ),
          GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            physics: ScrollPhysics(),
            children: 
              getcourselist(context).map((itemBox){return ItemBox(boxShadow: _boxShadow(), itemModel: itemModel);}).toList(),
            )
          ],
      ),
    );
  }

  List getcourselist(BuildContext context) {
    var provider = Provider.of<Controller>(context, listen: false);
    var category = Provider.of<CategoryChangeNotifier>(context).category;
    if (category == CategoryModels.all) {
      return provider.dataList;
    } else {
      return provider.dataList
          .where((itemModel) => itemModel.Category == category)
          .toList();
    }
  }

    BoxShadow _boxShadow() {
    return const BoxShadow(
      color: Color.fromARGB(172, 102, 102, 102),
      blurRadius: 5,
      spreadRadius: 1,
    );
  }
}