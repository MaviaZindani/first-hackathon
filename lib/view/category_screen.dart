import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttermidhackathon/components.dart';
import 'package:fluttermidhackathon/controllers/controller.dart';
import 'package:fluttermidhackathon/models/category_models.dart';
import 'package:fluttermidhackathon/models/item_model.dart';
import 'package:fluttermidhackathon/notifiyr.dart/category_change_notifier.dart';
import 'package:fluttermidhackathon/utils/bottem_navigation.dart';
import 'package:provider/provider.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<Controller>(context,listen: false);
    List<ItemModel> data = provider.dataList;
    return Scaffold(
      backgroundColor: e_themeColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        actions: [Icon(Icons.search)],
        title: Text('Category'),
        centerTitle: true,
      ),
      body: Stack(
        alignment: Alignment.topRight,
        children:[ 
          Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: 
                _offerContanier(data[0]),           
            ),
            const SizedBox(height: 30,),
            _category(context)
          ],
        ),
              _positioned(provider.offers),
        ]
      ),
      bottomNavigationBar: BottemNavigation(selectIndex: 3),
    );
  }
   Widget _offerContanier(ItemModel itemModel) {
    return Container(
        height: 140,
        width: double.maxFinite,
        decoration: BoxDecoration(
          color: e_purpelColor,
          borderRadius: BorderRadius.circular(33),
        ),
        child: Padding(
          padding: const EdgeInsets.all(28.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment:MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    itemModel.title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: e_whitetextColor,
                    ),
                  ),
              Text(
                itemModel.subtitel,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w800,
                  color: e_greytextColor,
                ),
              ),
                ],
              ),
              Text(
                '\$${itemModel.price}',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: e_whitetextColor),
              ),
            ],
          ),
        ));
  }

   Widget _positioned(List offers) {
    return Positioned(
      top: -40,
      right: 50,
      child: Container(
        height: 230,
        width: 300,
        decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/images/Frame.png'),fit: BoxFit.fill)
        ),
      ),
    );
  }

   Widget _category(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 10),
        child: GridView.builder(
          itemCount: CategoryModels.values.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
          itemBuilder: (context,index){
           CategoryModels categoryModels = CategoryModels.values[index];
            return categoryBox(categoryModels);
          }),
      ),
    );
  }

  Widget categoryBox(CategoryModels category){
    return Card(
      elevation: 4,
      child: Container(
        height: 5,
        width: 5,
        decoration: BoxDecoration(
          color: e_whiteItemBoxColor,
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
            Icon(Icons.watch),
            Text(category.title),
          ],),
        ),
      ),
    );
  }

    List getcourselist(BuildContext context) {
    var provider = Provider.of<Controller>(context, listen: false);
    var category = Provider.of<CategoryChangeNotifier>(context).category;
    if (category == CategoryModels.all) {
      return provider.dataList;
    } else {
      return provider.dataList.where((categorymodel) => categorymodel.Category == category).toList();
    }
  }

}