import 'package:flutter/material.dart';
import 'package:fluttermidhackathon/components.dart';
import 'package:fluttermidhackathon/controllers/controller.dart';
import 'package:fluttermidhackathon/models/item_model.dart';
import 'package:fluttermidhackathon/utils/bottem_navigation.dart';
import 'package:provider/provider.dart';

class ChackoutScreen extends StatefulWidget {
  const ChackoutScreen({super.key});

  @override
  State<ChackoutScreen> createState() => _ChackoutScreenState();
}

class _ChackoutScreenState extends State<ChackoutScreen> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<Controller>(context,listen: true);
    return Scaffold(
      backgroundColor: e_themeColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        actions: const [ Stack(
          alignment: Alignment.topRight,
          children: [
            Icon(Icons.shopping_basket),
            CircleAvatar(
              backgroundColor: Colors.red,
              radius: 2,
            )
          ],
        )],
        title: const Text('Cart'),
      ),
      body: Stack(
        alignment: Alignment.topCenter,
        children:[ 
          SizedBox(
            width: double.maxFinite,
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: provider.selectedItems.length,
              itemBuilder: (context,index){
                ItemModel selectedItem = provider.selectedItems[index];
                return _selectedItem(selectedItem,provider);
              }),
          ),
         Padding(
           padding: const EdgeInsets.only(bottom: 15.0),
           child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
             children: [
              Padding(
                padding: const EdgeInsets.only(left: 16.0,right: 16,bottom: 15),
                child: Card(
                  elevation: 1,
                  child: Container(
                      height: 150,
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                        color: e_whiteItemBoxColor,
                        borderRadius: BorderRadius.circular(18),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 12),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Row(
                              children: [
                                const Text('Select item: ',
                                style: TextStyle(
                                  color: e_greytextColor,
                                  fontSize: 14
                                ),),
                                Text(provider.selectedItems.length.toString(),
                                style: const TextStyle(
                                  color: e_blacktextColor,
                                  fontSize: 16
                                ),),
                              ],
                            ),
                             Row(
                              children: [
                                 const Text('Subtotal Price: ',
                                style: TextStyle(
                                  color: e_greytextColor,
                                  fontSize: 14
                                ),),
                                Text('${provider.subtotal}',
                                style: const TextStyle(
                                  color: e_blacktextColor,
                                  fontSize: 16
                                ),),
                              ],
                            ),
                             Row(
                              children: [
                               const Text('Discount: ',
                                style: TextStyle(
                                  color: e_greytextColor,
                                  fontSize: 14,
                                ),),
                                Text('%${provider.discount}',
                                 style: const TextStyle(
                                  color: e_blacktextColor,
                                  fontSize: 16,
                                ),),
                              ],
                            ),
                            Row(
                              children: [
                                const Text('Total: ',
                                style: TextStyle(
                                  color: e_greytextColor,
                                  fontSize: 14
                                ),),
                                Text('${provider.total}',
                                 style: const TextStyle(
                                  color: e_purpelColor,
                                  fontSize: 20
                                ),),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                ),
              ),
               Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Container(
                  height: 50,
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    color: e_purpelColor,
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: const Center(
                      child: Text(
                    'Purchase',
                    style: TextStyle(
                      color: e_whitetextColor,
                      fontSize: 16,
                    ),
                  )),
                ),
                       ),
             ],
           ),
         ),
        ]
      ),
      bottomNavigationBar: BottemNavigation(selectIndex: 3),
    );
  }

  Widget _selectedItem(ItemModel itemModel,Controller provider){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Card(
        elevation: 1,
        child: Container(
          height: 110,
          width: double.maxFinite,
          decoration: BoxDecoration(
            color: e_whiteItemBoxColor,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 3),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                    Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(itemModel.title,
                    style: const  TextStyle(
                          color: e_blacktextColor,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),),
                Row(
                  children: [
                    const Icon(Icons.star_outlined,color: Colors.amber,),
                    const SizedBox(width: 5,),
                    Text('(${itemModel.reviews} reviews)',
                    style: const TextStyle(
                      color: e_greytextColor,
                      fontSize: 18,
                      fontWeight: FontWeight.w200,
                    ),),
                  ],
                ),
                 Text('\$${itemModel.price}',
                    style: const TextStyle(
                      color: e_purpelColor,
                      fontSize: 24,
                      fontWeight: FontWeight.w800,
                    ),
                    ),
                  ],
                ),
                 Row(
                  children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                     onPressed: (){
                       provider.addNumberOfProduct(itemModel);
                       provider.subTotalFunc(itemModel);
                       provider.totalFunc();
                     },
                     icon: const Icon(Icons.add_circle_outline_sharp,color: e_greytextColor)
                    ),
                     Text('${itemModel.numberOfProduct}'),
                    IconButton(
                     onPressed: (){
                      provider.removeNumberOfProdect(itemModel);
                      provider.subtractTotalFunc(itemModel);
                      provider.totalFunc();
                     },
                     icon: const Icon(Icons.remove_circle_outline_sharp,color: e_greytextColor,)
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 7.0),
                  child: Image.asset(itemModel.thumbnaiul),
                ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
