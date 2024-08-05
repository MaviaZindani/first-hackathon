import 'package:flutter/material.dart';
import 'package:fluttermidhackathon/components.dart';
import 'package:fluttermidhackathon/models/item_model.dart';
import 'package:fluttermidhackathon/view/details_screen.dart';

class ItemBox extends StatelessWidget {
  final BoxShadow boxShadow;
  final ItemModel itemModel;
  const ItemBox({super.key, required this.boxShadow, required this.itemModel});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => DetailsScreen(itemModel: itemModel)));
      },
      child: Container(
        height: 240,
        width: 200,
        decoration: BoxDecoration(
          color: e_whiteItemBoxColor,
          borderRadius: BorderRadius.circular(22),
          boxShadow: [boxShadow],
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Align(
              alignment: Alignment.topRight,
              child: Icon(Icons.favorite,color: e_iconColor,size: 28,)),
            Container(
              height: 80,
              width: double.maxFinite,
              child: Image.asset(itemModel.thumbnaiul)),
            Padding(
              padding: const EdgeInsets.only(left: 10.0,right: 10,top: 10),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(itemModel.title,
                  style: const  TextStyle(
                        color: e_blacktextColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w200,
                      ),),
              Row(
                children: [
                  const Icon(Icons.star_outlined,color: Colors.amber,),
                  const SizedBox(width: 10,),
                  Text('${itemModel.reviews} reviews',
                  style: const TextStyle(
                    color: e_greytextColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w200,
                  ),),
                ],
              ),
               Text('\$${itemModel.price}',
                  style: const TextStyle(
                    color: e_purpelColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                  ),
                ],
              ),
            ),
          ],),
        ),
      ),
    );
  }
}