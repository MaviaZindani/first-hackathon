enum CategoryModels {bag,watch,shoes,jewlery,sprots,music,gift,plant,phone,furniture,cosmetic,hobby,all}

extension CategoryModelsExtenstion on CategoryModels{
  String get title {
    switch (this) {
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
       case CategoryModels.all:
       return 'All';
    }
  }
}

