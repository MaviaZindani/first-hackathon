import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttermidhackathon/components.dart';
import 'package:provider/provider.dart';
import 'package:fluttermidhackathon/controllers/controller.dart';
import 'package:fluttermidhackathon/models/category_models.dart';
import 'package:fluttermidhackathon/models/item_model.dart';
import 'package:fluttermidhackathon/utils/bottem_navigation.dart';
import 'package:fluttermidhackathon/utils/routes_name.dart';
import 'package:fluttermidhackathon/widgets/item_box.dart';
import 'package:fluttermidhackathon/widgets/offer_container.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<Controller>(context,listen: true);
    final data = provider.dataList;
    FirebaseFirestore firebase = FirebaseFirestore.instance;
    return Scaffold(
      backgroundColor: e_themeColor,
      appBar: AppBar(
        centerTitle: true,
        actions: const [Icon(Icons.search)],
        backgroundColor: Colors.transparent,
        title: const Text('Home'),
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildOfferContainer(data[0]),
                const SizedBox(height: 20),
                _buildCategoryList(data, provider.category,provider),
                const SizedBox(height: 20),
                _buildPopularProduct(provider),
                const SizedBox(height: 20),
                _buildListProduct(data[0], provider,firebase),
                const SizedBox(height: 20),
              ],
            ),
            _buildPositionedOffer(provider.offers),
          ],
        ),
      ),
      bottomNavigationBar: const BottemNavigation(selectIndex: 1),
    );
  }

  Widget _buildOfferContainer(ItemModel itemModel) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 20),
      child: OfferContainer(itemModel: itemModel),
    );
  }

  Widget _buildCategoryList(List<ItemModel> data, CategoryModels category,Controller provider) {
    return SizedBox(
      height: 85,
      width: double.infinity,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Category',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey),
                ),
                InkWell(
                  onTap: () =>
                      Navigator.pushNamed(context, RoutesName.categoryScreen),
                  child: const Text(
                    'See all',
                    style: TextStyle(fontSize: 15, color: Colors.blue),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          _buildCategoryListView(category,provider),
        ],
      ),
    );
  }

  Widget _buildCategoryListView(CategoryModels selectedCategory,Controller provider) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: SizedBox(
        height: 35,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: CategoryModels.values.length,
          itemBuilder: (context, index) {
            final categoryModels = CategoryModels.values[index];
            return InkWell(
              onTap: () {
                provider.changeCategory(categoryModels);
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: Card(
                  elevation: 3,
                  color: selectedCategory == categoryModels
                      ? e_purpelColor
                      : Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Center(
                      child: Text(
                        categoryModels.title,
                        style: TextStyle(
                          color: selectedCategory == categoryModels
                              ? e_whitetextColor
                              : e_blacktextColor,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildPopularProduct(Controller provider) {
    return SizedBox(
      width: double.infinity,
      height: 260,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Popular Product',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey),
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, RoutesName.productScreen);
                  },
                  child: const Text(
                    'See all',
                    style: TextStyle(fontSize: 15, color: Colors.blue),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 220,
            width: double.infinity,
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              scrollDirection: Axis.horizontal,
              itemCount: provider.buildgetitemlist(context).length,
              itemBuilder: (context, index) {
                return provider.buildgetitemlist(context).map((itemModel) => ItemBox(itemModel: itemModel)).toList()[index];
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPositionedOffer(List offers) {
    return Positioned(
      top: -30,
      right: 50,
      child: Container(
        height: 230,
        width: 300,
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage('assets/images/Frame.png'),
          ),
        ),
      ),
    );
  }

  Widget _buildListProduct(ItemModel itemModel, Controller provider,FirebaseFirestore firestore) {
    Future getdata(){
    return firestore.collection('dataList').get();
    }
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Latest Product',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey),
              ),
              InkWell(
                onTap: () {},
                child: const Text(
                  'See all',
                  style: TextStyle(fontSize: 15, color: Colors.blue),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: double.maxFinite,
          child: FutureBuilder(
            future: getdata(),
            builder:
            (context, AsyncSnapshot snapshot){
              if (snapshot.connectionState == ConnectionState.waiting){
                return const CircularProgressIndicator();
              }else if (snapshot.connectionState == ConnectionState.none) {
                return const Center(
                  child: Text('No data'),
                );
              }else{
             return ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: snapshot.data.docs.length,
              itemBuilder: (context, index) {
                final item = provider.dataList[index];
                return ListTile(
                  leading: Image.asset(item.thumbnaiul),
                  title: Text(
                    snapshot.data.docs[index]['titel'],
                    style: const TextStyle(
                        color: e_blacktextColor,
                        fontSize: 18,
                        fontWeight: FontWeight.w200),
                  ),
                  subtitle: Row(
                    children: [
                      Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.star_outlined, color: Colors.amber,size: 16,),
                      const SizedBox(width: 5),
                      Text(
                        '(${item.reviews} reviews)',
                        style: const TextStyle(
                            color: e_greytextColor,
                            fontSize: 14,
                            fontWeight: FontWeight.w200),
                      ),
                    ],
                  ),
                  const SizedBox(width: 10,),
                      Text(
                        '\$${item.price}',
                        style: const TextStyle(
                            color: e_purpelColor,
                            fontSize: 18,
                            fontWeight: FontWeight.w200),
                      ),
                    ],
                  ),
                  trailing: IconButton(onPressed: (){}, icon: const Icon(Icons.favorite_border_outlined,color: Colors.red,)),
                );
              },
            );
              }
            }
          ),
        ),
      ],
    );
  }



}
