import 'package:flutter/material.dart';
import 'package:fluttermidhackathon/components.dart';
import 'package:fluttermidhackathon/controllers/controller.dart';
import 'package:fluttermidhackathon/models/item_model.dart';
import 'package:fluttermidhackathon/view/details_screen.dart';
import 'package:provider/provider.dart';

class ItemBox extends StatelessWidget {
  final ItemModel itemModel;
  const ItemBox({super.key, required this.itemModel});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<Controller>(context,listen: true);
    return Card(
      elevation: 3,
      child: GestureDetector(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => DetailsScreen(itemModel: itemModel)));
        },
        child: Container(
          height: 250,
          width: 200,
          decoration: BoxDecoration(
            color: e_whiteItemBoxColor,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
             
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
                child: Container(
                  height: 90,
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage(itemModel.thumbnaiul),fit: BoxFit.fill)
                  ),),
              ),
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
                    const SizedBox(width: 8,),
                    Text('(${itemModel.reviews} reviews)',
                    style: const TextStyle(
                      color: e_greytextColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w200,
                    ),),
                  ],
                ),
                    const SizedBox(height: 10,),
                 Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     Text('\$${itemModel.price}',
                        style: const TextStyle(
                          color: e_purpelColor,
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                        ),
                    GestureDetector(
                      onTap: () {
                        if (itemModel.isFavorite == false) {
                          provider.addFavorite(itemModel);
                        }else{
                          provider.removeFromFavorite(itemModel);
                        }
                      },
                      child: Icon(
                      itemModel.isFavorite == true?
                      Icons.favorite:
                      Icons.favorite_border_outlined,
                      color: Colors.red,
                      size: 24,))
                   ],
                 ),
                  ],
                ),
              ),
            ],),
          ),
        ),
      ),
    );
  }
}