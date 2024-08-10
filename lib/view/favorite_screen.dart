import 'package:flutter/material.dart';
import 'package:fluttermidhackathon/components.dart';
import 'package:fluttermidhackathon/controllers/controller.dart';
import 'package:fluttermidhackathon/utils/bottem_navigation.dart';
import 'package:provider/provider.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<Controller>(context,listen: true);
    return Scaffold(
      appBar: AppBar(
        title: const Text('FavoriteScreen'),
      ),
      body: SizedBox(
          height: double.maxFinite,
          width: double.maxFinite,
          child: ListView.builder(
              itemCount: provider.favrioteList.length,
              itemBuilder: (context, index) {
                final item = provider.favrioteList[index];
                return ListTile(
                  leading: Image.asset(item.thumbnaiul),
                  title: Text(
                    item.title,
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
                  SizedBox(width: 10,),
                      Text(
                        '\$${item.price}',
                        style: const TextStyle(
                            color: e_purpelColor,
                            fontSize: 18,
                            fontWeight: FontWeight.w200),
                      ),
                    ],
                  ),
                  trailing: IconButton(
                    onPressed: (){
                      provider.removeFromFavorite(item);
                    }, 
                    icon: const Icon(Icons.delete_outline,color: Colors.red,)),
                );},
            ),
        ),
        // GestureDetector(
        //   onTap: () {
        //     provider.addAllToChackout(provider.favrioteList);
        //   },
        //   child: Padding(
        //     padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 12),
        //     child: Container(
        //       height: 50,
        //       width: double.maxFinite,
        //       decoration: BoxDecoration(
        //         color: e_purpelColor,
        //         borderRadius: BorderRadius.circular(22)),
        //       child: const Center(
        //         child: Text('Chackout All',
        //         style: TextStyle(
        //           color: e_whitetextColor,
        //           fontSize: 18,
        //           fontWeight: FontWeight.w400
        //         ),),
        //       ),
        //     ),
        //   ),
        // ),
      bottomNavigationBar: const BottemNavigation(selectIndex: 2),
    );
  }
}