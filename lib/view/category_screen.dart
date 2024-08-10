import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fluttermidhackathon/components.dart';
import 'package:fluttermidhackathon/models/item_model.dart';
import 'package:fluttermidhackathon/controllers/controller.dart';
import 'package:fluttermidhackathon/models/category_models.dart';
import 'package:fluttermidhackathon/utils/bottem_navigation.dart';
import 'package:fluttermidhackathon/widgets/offer_container.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<Controller>(context, listen: false);
    List<ItemModel> data = provider.dataList;
    return Scaffold(
      backgroundColor: e_themeColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        actions: const [Icon(Icons.search)],
        title: const Text('Category'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        
        physics: ClampingScrollPhysics(),
        child: Stack(alignment: Alignment.topRight, children: [
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 20,),
                _buildOfferContainer(data),
                const SizedBox(height: 30,),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25,vertical: 10),
                  child: _buildcategorysList(context)
                  ),
              ],
            ),
          ),
          _buildpositionedOffer(provider.offers),
        ]),
      ),
      bottomNavigationBar: BottemNavigation(selectIndex: 3),
    );
  }

  Widget _buildOfferContainer(List<ItemModel> data) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: OfferContainer(
        itemModel: data[0],
      ),
    );
  }

  Widget _buildcategorysList(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
        itemCount: CategoryModels.values.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3),
        itemBuilder: (context, index) {
          CategoryModels categoryModels = CategoryModels.values[index];
          return categoryBox(categoryModels);
        });
  }

  Widget categoryBox(CategoryModels category) {
    return Card(
      elevation: 3,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Card(
                elevation: 1,
                color: e_categoryIconBoxColor,
                shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(1)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: Center(
                      child: Icon(
                    category.icon,
                    color: e_iconColor,
                  )),
                ),
              ),
            ),
            Text(category.title),
          ],
        ),
      ),
    );
  }

  Widget _buildpositionedOffer(List offers) {
    return Positioned(
      top: -30,
      right: 50,
      child: Container(
        height: 230,
        width: 300,
        decoration: const BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage('assets/images/Frame.png'))),
      ),
    );
  }
}
