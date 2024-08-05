import 'package:flutter/material.dart';
import 'package:fluttermidhackathon/components.dart';
import 'package:fluttermidhackathon/models/item_model.dart';

class ChackoutScreen extends StatelessWidget {
  final List<ItemModel> selectedItems;
  const ChackoutScreen({super.key, required this.selectedItems});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: e_themeColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        actions: [Stack(
          alignment: Alignment.topRight,
          children: [
            Icon(Icons.shopping_basket),
            CircleAvatar(
              backgroundColor: Colors.red,
              radius: 2,
            )
          ],
        )],
        title: Text('Cart'),
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children:[ 
          Column(
            children: [
              SizedBox(
                width: double.maxFinite,
                child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: selectedItems.length,
                  itemBuilder: (context,index){
                    ItemModel selectedItem = selectedItems[index];
                    return _selectedItem(selectedItem);
                  }),
              ),
              Container(
                height: 300,
                width: double.maxFinite,
                decoration: BoxDecoration(
                  color: e_whiteItemBoxColor,
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text('Select item:',
                        style: TextStyle(
                          color: e_greytextColor,
                          fontSize: 18
                        ),),
                        Text(selectedItems.length.toString(),
                        style: TextStyle(
                          color: e_blacktextColor,
                          fontSize: 20
                        ),),
                      ],
                    ),
                    const SizedBox(height: 20,),
                    Row(
                      children: [
                        const Text('Subtotal Price:',
                        style: TextStyle(
                          color: e_greytextColor,
                          fontSize: 18
                        ),),
                        Text('',
                        style: TextStyle(
                          color: e_blacktextColor,
                          fontSize: 20
                        ),),
                      ],
                    ),
                     const SizedBox(height: 20,),
                    Row(
                      children: [
                        const Text('Discount (%20):',
                        style: TextStyle(
                          color: e_greytextColor,
                          fontSize: 18
                        ),),
                        Text('',
                         style: TextStyle(
                          color: e_blacktextColor,
                          fontSize: 20
                        ),),
                      ],
                    ),
                    const SizedBox(height: 20,),
                    Row(
                      children: [
                        const Text('Total:',
                        style: TextStyle(
                          color: e_greytextColor,
                          fontSize: 18
                        ),),
                        Text('',
                         style: TextStyle(
                          color: e_purpelColor,
                          fontSize: 26
                        ),),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
         Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Container(
            height: 60,
            width: double.maxFinite,
            decoration: BoxDecoration(
              color: e_purpelColor,
              borderRadius: BorderRadius.circular(18),
            ),
            child: Center(
                child: Text(
              'Add To Cart',
              style: TextStyle(
                color: e_whitetextColor,
                fontSize: 16,
              ),
            )),
          ),
        ),
        ]
      ),
    );
  }
  Widget _selectedItem(ItemModel itemModel){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Container(
        height: 180,
        width: double.maxFinite,
        decoration: BoxDecoration(
          color: e_whiteItemBoxColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
             Row(
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
                      fontWeight: FontWeight.w200,
                    ),),
            Row(
              children: [
                const Icon(Icons.star_outlined,color: Colors.amber,),
                const SizedBox(width: 10,),
                Text('${itemModel.reviews} reviews',
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
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                ),
                ),
              ],
            ),
            Column(
              children: [
                IconButton(onPressed: (){}, icon: Icon(Icons.add)),
                Text(''),
                IconButton(onPressed: (){}, icon: Icon(Icons.remove))

              ],
            )
              ],
            ),
            Image.asset(itemModel.thumbnaiul),
          ],
        ),
      ),
    );
  }
}
