import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttermidhackathon/components.dart';
import 'package:fluttermidhackathon/controllers/controller.dart';
import 'package:fluttermidhackathon/models/item_model.dart';
import 'package:fluttermidhackathon/utils/bottem_navigation.dart';
import 'package:fluttermidhackathon/view/chackout_screen.dart';
import 'package:provider/provider.dart';

class DetailsScreen extends StatelessWidget {
  final ItemModel itemModel;
  const DetailsScreen({super.key, required this.itemModel});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<Controller>(context,listen: true);
    return Scaffold(
      backgroundColor: e_themeColor,
      appBar: AppBar(
        actions: [
          IconButton(onPressed: (){
            provider.addFavorite(itemModel);
          },
        icon: Icon(
          itemModel.isFavorite == false?
          Icons.favorite_border:
          Icons.favorite,
        color: Colors.red,))],
        title: const Text('Product Details'),
        backgroundColor: Colors.transparent,
        centerTitle: true,
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
        SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: CircleAvatar(
                  radius: 90,
                  backgroundImage: AssetImage(itemModel.thumbnaiul),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left:  25.0,right: 25,top: 15,bottom: 70),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      itemModel.title,
                      style: const TextStyle(
                        color: e_blacktextColor,
                        fontSize: 26,
                        fontWeight: FontWeight.w600
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      itemModel.subtitel,
                      style: const TextStyle(
                        color: e_blacktextColor,
                        fontSize: 18,
                        fontWeight: FontWeight.w400
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Row(
                      children: [
                        Icon(
                          Icons.star_outlined,
                          color: Colors.amber,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Icon(
                          Icons.star_outlined,
                          color: Colors.amber,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Icon(
                          Icons.star_outlined,
                          color: Colors.amber,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Icon(
                          Icons.star_outlined,
                          color: Colors.amber,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Icon(
                          Icons.star_outlined,
                          color: Colors.amber,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'Colors',
                      style: TextStyle(
                        color: e_blacktextColor,
                        fontSize: 18,
                        fontWeight: FontWeight.w400
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Container(
                          height: 33,
                          width: 33,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(22),
                              border: Border.all(color: e_purpelColor, width: 1.2)),
                          child: const Center(
                            child: Padding(
                              padding: EdgeInsets.all(2.0),
                              child: CircleAvatar(
                                radius: 28,
                                backgroundColor: e_purpelColor,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Container(
                          height: 33,
                          width: 33,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(22),
                              border:
                                  Border.all(color: e_bluetextColor, width: 1.2)),
                          child: const Center(
                            child: Padding(
                              padding: EdgeInsets.all(2.0),
                              child: CircleAvatar(
                                radius: 28,
                                backgroundColor: e_bluetextColor,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Container(
                          height: 33,
                          width: 33,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(22),
                              border:
                                  Border.all(color: e_blacktextColor, width: 1.2)),
                          child: const Center(
                            child: Padding(
                              padding: EdgeInsets.all(2.0),
                              child: CircleAvatar(
                                radius: 28,
                                backgroundColor: e_blacktextColor,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Container(
                          height: 33,
                          width: 33,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(22),
                              border:
                                  Border.all(color: e_greytextColor, width: 1.2)),
                          child: const Center(
                            child: Padding(
                              padding: EdgeInsets.all(2.0),
                              child: CircleAvatar(
                                radius: 28,
                                backgroundColor: e_greytextColor,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'About',
                      style: TextStyle(
                        color: e_blacktextColor,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      itemModel.discription,
                      style: const TextStyle(
                        color: e_greytextColor,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 12),
          child: InkWell(
            onTap: (){
              provider.addToChackout(itemModel);
              provider.subTotalFunc(itemModel);
              provider.totalFunc();
            },
            child: Container(
              height: 45,
              width: double.maxFinite,
              decoration: BoxDecoration(
                color: e_purpelColor,
                borderRadius: BorderRadius.circular(18),
              ),
              child: const Center(
                  child: Text(
                'Add To Cart',
                style: TextStyle(
                  color: e_whitetextColor,
                  fontSize: 16,
                ),
              )),
            ),
          ),
        ),
      ]),
      );
  }
}
