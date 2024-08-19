import 'package:flutter/material.dart';
import 'package:fluttermidhackathon/components.dart';
import 'package:fluttermidhackathon/controllers/controller.dart';
import 'package:fluttermidhackathon/widgets/item_box.dart';
import 'package:provider/provider.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<Controller>(context,listen: true);
    return Scaffold(
      backgroundColor: e_themeColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text('Popular Product'),
        centerTitle: true,
        actions: const [Stack(
          alignment: Alignment.topRight,
          children: [
            Icon(Icons.shopping_basket),
            CircleAvatar(
              backgroundColor: Colors.red,
              radius: 2,
            )
          ],
        )],
      ),
      body: Expanded(
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemCount: provider.buildgetitemlist(context).length,
          itemBuilder: (contex,index) {
           return provider.buildgetitemlist(context).map((itemmodel) => ItemBox(itemModel: itemmodel)).toList()[index];
          },
        ),
      ),
    );
  }
}