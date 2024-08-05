import 'package:flutter/material.dart';
import 'package:fluttermidhackathon/components.dart';
import 'package:fluttermidhackathon/utils/routes_name.dart';

class BottemNavigation extends StatefulWidget {
  BottemNavigation({super.key, required this.selectIndex});
  
  final int selectIndex;

  @override
  State<BottemNavigation> createState() => _BottemNavigationState();
}

class _BottemNavigationState extends State<BottemNavigation> {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape:const CircularNotchedRectangle(),
      notchMargin: 5,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: (){
                Navigator.pushNamed(context, openScreen(context, 1));
              },
              child: Padding(
                padding: EdgeInsets.all(5.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.home,color: getSelectedColor(1),),
                    SizedBox(
                      height: 1,
                    ),
                    Text(
                      'Home',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13,color: getSelectedColor(1)),
                    ),
                  ],
                ),
              ),
            ),
        
            InkWell(
              onTap: (){
                Navigator.pushNamed(context, openScreen(context, 2));
              },
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.class_,color: getSelectedColor(2)),
                    SizedBox(
                      height: 1,
                    ),
                    Text(
                      'My Classes',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13,color: getSelectedColor(2)),
                    ),
                  ],
                ),
              ),
            ),
        
            InkWell(
              onTap: (){
                Navigator.pushNamed(context, openScreen(context, 3));
              },
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.list,color: getSelectedColor(3)),
                    SizedBox(
                      height: 1,
                    ),
                    Text(
                      'Wish List',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13,color: getSelectedColor(3)),
                    ),
                  ],
                ),
              ),
            ),
        
            InkWell(
              onTap: (){
                Navigator.pushNamed(context, openScreen(context, 4));
              },
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.person,color: getSelectedColor(4)),
                    SizedBox(
                      height: 1,
                    ),
                    Text('Account',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13,color: getSelectedColor(4)),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Color getSelectedColor(int optionIndex) {
    return (widget.selectIndex == optionIndex) ? e_purpelColor : Colors.grey.shade800;
  }

   openScreen(BuildContext context,int selectOption){
    String routeName = RoutesName.homeScreen;
    switch (selectOption) {
      case 1:
        routeName = RoutesName.homeScreen;
        break;
      case 2:
        routeName = RoutesName.detailScreen;
        break;
      case 3:
        routeName = RoutesName.categoryScreen;
      case 4:
        routeName = RoutesName.loginScreen;
      default:
    } 
    return routeName;
  }
}