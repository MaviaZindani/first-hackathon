import 'package:flutter/material.dart';
import 'package:fluttermidhackathon/components.dart';
import 'package:fluttermidhackathon/models/item_model.dart';

class OfferContainer extends StatelessWidget {
 final ItemModel itemModel;
  const OfferContainer({super.key, required this.itemModel});

  @override
  Widget build(BuildContext context) {
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
                      fontSize: 18.4,
                      fontWeight: FontWeight.w700,
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
                    fontSize: 23,
                    fontWeight: FontWeight.w700,
                    color: e_whitetextColor),
              ),
            ],
          ),
        ));
  
  }
}