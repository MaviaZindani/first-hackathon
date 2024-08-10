import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum CategoryModels {all,bag,watch,shoes,jewlery,sprots,music,gift,plant,phone,furniture,cosmetic,hobby}

extension CategoryModelsExtenstion on CategoryModels{
  String get title {
    switch (this) {
      case CategoryModels.all:
       return 'All';
      case CategoryModels.bag:
       return 'Bag';
      case CategoryModels.watch:
       return 'watch';
       case CategoryModels.shoes:
       return 'shoes';
       case CategoryModels.jewlery:
       return 'jewlery';
       case CategoryModels.sprots:
       return 'sprots';
       case CategoryModels.music:
       return 'music';
       case CategoryModels.gift:
       return 'gift';
       case CategoryModels.plant:
       return 'plant';
       case CategoryModels.phone:
       return 'phone';
       case CategoryModels.furniture:
       return 'furniture';
       case CategoryModels.cosmetic:
       return 'cosmetic';
       case CategoryModels.hobby:
       return 'hobby';
    }
  }
  IconData get icon {
    switch (this) {
      case CategoryModels.all:
       return FontAwesomeIcons.a;
      case CategoryModels.bag:
       return Icons.shopping_bag;
      case CategoryModels.watch:
       return Icons.watch;
       case CategoryModels.shoes:
       return FontAwesomeIcons.shoelace;
       case CategoryModels.jewlery:
       return FontAwesomeIcons.ring;
       case CategoryModels.sprots:
       return FontAwesomeIcons.football;
       case CategoryModels.music:
       return FontAwesomeIcons.music;
       case CategoryModels.gift:
       return FontAwesomeIcons.gift;
       case CategoryModels.plant:
       return FontAwesomeIcons.tree;
       case CategoryModels.phone:
       return FontAwesomeIcons.mobile;
       case CategoryModels.furniture:
       return FontAwesomeIcons.couch;
       case CategoryModels.cosmetic:
       return FontAwesomeIcons.maskFace;
       case CategoryModels.hobby:
       return FontAwesomeIcons.buildingShield;
    }
}

}