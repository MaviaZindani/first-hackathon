import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttermidhackathon/components.dart';
import 'package:fluttermidhackathon/controllers/controller.dart';
import 'package:fluttermidhackathon/models/category_models.dart';
import 'package:fluttermidhackathon/models/item_color_model.dart';
import 'package:fluttermidhackathon/models/item_model.dart';
import 'package:fluttermidhackathon/notifiyr.dart/category_change_notifier.dart';
import 'package:fluttermidhackathon/utils/bottem_navigation.dart';
import 'package:fluttermidhackathon/utils/routes_name.dart';
import 'package:fluttermidhackathon/view/favriote_screen.dart';
import 'package:fluttermidhackathon/widgets/item_box.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    Controller mavia = Controller();
    var provider = Provider.of<Controller>(context, listen: false);
    CategoryModels category =
    Provider.of<CategoryChangeNotifier>(context).category;
    List<ItemModel> data = provider.dataList;
    return Scaffold(
      backgroundColor: e_themeColor,
      appBar: AppBar(
        centerTitle: true,
        actions: [
          Icon(Icons.search),
        ],
        backgroundColor: Colors.transparent,
        title: Text('Home'),
      ),
      body: SingleChildScrollView(
        child: Stack(
          children:[ Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0,vertical: 20),
                child: 
                  _offerContanier(data[0]),            
              ),
              const SizedBox(
                height: 20,
              ),
              _category(data, provider, category),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: _featherCourse(data, provider),
              ),
              const SizedBox(
                height: 20,
              ),
              // _listProduct(data[0], provider),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
                _positioned(provider.offers),
          ]
        ),
      ),
      bottomNavigationBar: BottemNavigation(selectIndex: 1,),
    );
  }

  Widget _category(
      List<ItemModel> data, Controller provider, CategoryModels category) {
    return SizedBox(
      height: 74,
      width: double.maxFinite,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Category',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.grey.shade800,
                      fontWeight: FontWeight.bold),
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, RoutesName.categoryScreen);
                  },
                  child: const Text(
                    'See all',
                    style: TextStyle(fontSize: 15, color: Colors.blue),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
              height: 35,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: CategoryModels.values.length,
                  itemBuilder: (context, index) {
                    CategoryModels categoryModels = CategoryModels.values[index];
                    return InkWell(
                      onTap: () {
                        Provider.of<CategoryChangeNotifier>(context,listen: false).changeCategory(categoryModels);
                        getcourselist(context);
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Card(
                          elevation: 2,
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 5),
                            // height: 10,
                            decoration: BoxDecoration(
                              color: category == categoryModels
                                  ? e_purpelColor
                                  : Colors.white,
                              borderRadius: BorderRadius.circular(12),
                              // boxShadow: [_boxShadow()],
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 25.0),
                              child: Center(
                                  child: Text(
                                categoryModels.title,
                                style: TextStyle(
                                  color: category == categoryModels
                                      ? e_whitetextColor
                                      : e_blacktextColor,
                                ),
                              )),
                            ),
                          ),
                        ),
                      ),
                    );
                  })),
        ],
      ),
    );
  }

  Widget _offerContanier(ItemModel itemModel) {
    return Container(
        height: 150,
        width: double.maxFinite,
        decoration: BoxDecoration(
          color: e_purpelColor,
          borderRadius: BorderRadius.circular(33),
        ),
        child: Padding(
          padding: const EdgeInsets.all(28),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
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
      top: -30,
      right: 50,
      child: Container(
        height: 230,
        width: 300,
        decoration: BoxDecoration(
          image: DecorationImage(fit: BoxFit.fill ,image: AssetImage('assets/images/Frame.png'))
        ),
      ),
    );
  }
  Widget _featherCourse(List<ItemModel> data, Controller provide) {
    return SizedBox(
      width: double.maxFinite,
      height: 260,
      child: Column(
        children: [
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Popular Product',
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.grey.shade800,
                    fontWeight: FontWeight.bold),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>FavrioteScreen(itemModel: data[1])));
                },
                child: const Text(
                  'See all',
                  style: TextStyle(fontSize: 15, color: Colors.blue),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          height: 220,
          width: double.maxFinite,
          child: ListView.builder(
            shrinkWrap: true,
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              scrollDirection: Axis.horizontal,
              itemCount: data.length,
              itemBuilder: (context, index) {
                ItemModel myitemModel = data[index];
                return Row(
                  children: [
                    ItemBox(boxShadow: _boxShadow(), itemModel: myitemModel),
                    SizedBox(width: 10,),
                  ],
                );
              }),
        )
      ]),
    );
  }

  List getcourselist(BuildContext context) {
    var provider = Provider.of<Controller>(context, listen: false);
    var category = Provider.of<CategoryChangeNotifier>(context).category;
    if (category == CategoryModels.all) {
      return provider.dataList;
    } else {
      return provider.dataList.where((categoryModels) => categoryModels.Category == category).toList();
    }
  }

  Widget _listProduct(ItemModel itemModel, Controller provider) {
    return Column(children: [
      Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Popular Product',
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.grey.shade800,
                  fontWeight: FontWeight.bold),
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
      const SizedBox(
        height: 10,
      ),
      SizedBox(
        height: double.maxFinite,
        width: double.maxFinite,
        child: ListView.builder(
            itemCount: provider.dataList.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: Text(itemModel.thumbnaiul),
                title: Text(
                  itemModel.title,
                  style: const TextStyle(
                    color: e_blacktextColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w200,
                  ),
                ),
                subtitle: Text(
                  '\$${itemModel.price}',
                  style: const TextStyle(
                    color: e_greytextColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w200,
                  ),
                ),
                trailing: Row(
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.star_outlined,
                          color: Colors.amber,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          '${itemModel.reviews} reviews',
                          style: const TextStyle(
                            color: e_greytextColor,
                            fontSize: 18,
                            fontWeight: FontWeight.w200,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            }),
      ),
    ]);
  }

  BoxShadow _boxShadow() {
    return const BoxShadow(
      color: Color.fromARGB(172, 102, 102, 102),
      blurRadius: 5,
      spreadRadius: 1,
    );
  }
}
