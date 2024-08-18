import 'package:flutter/material.dart';
import 'package:ingredient_cooker/features/presentation/state%20management/Services/API_Services.dart';
import 'package:ingredient_cooker/features/presentation/pages/category_Screens/Dairy.dart';
import 'package:ingredient_cooker/features/presentation/pages/category_Screens/DryNut.dart';
import 'package:ingredient_cooker/features/presentation/pages/category_Screens/Flour.dart';
import 'package:ingredient_cooker/features/presentation/pages/category_Screens/Fruit.dart';
import 'package:ingredient_cooker/features/presentation/pages/category_Screens/Meat.dart';
import 'package:ingredient_cooker/features/presentation/pages/category_Screens/Pulses.dart';
import 'package:ingredient_cooker/features/presentation/pages/category_Screens/Shakes.dart';
import 'package:ingredient_cooker/features/presentation/pages/category_Screens/Spices.dart';
import 'package:ingredient_cooker/features/presentation/pages/category_Screens/Veggies.dart';
import 'package:ingredient_cooker/features/presentation/pages/utils/grid_utils.dart';
import 'package:ingredient_cooker/features/presentation/state%20management/gridSwitch.dart';
import 'package:provider/provider.dart';

class CategoryGrid extends StatefulWidget {
  const CategoryGrid({super.key, 
  // required this.location, 
  // required this.content
  });
// final String location;
// final String content;
  @override
  State<CategoryGrid> createState() => _CategoryGridState();
}

class _CategoryGridState extends State<CategoryGrid> {
  @override
                // Map ingredientsIndex = ingredients_list.asMap();

  Widget build(BuildContext context) {
     final prov = Provider.of<GridSwitch>(context);
     final api = Provider.of<APIService>(context);
                    final value = prov.selectindex;
                    
    
    return Container(
      height: 290,
      width: 250,
      child: GridView.count(
        physics: NeverScrollableScrollPhysics(),
        crossAxisSpacing: 5.0,
        mainAxisSpacing: 5.0,
        crossAxisCount: 3,
        children: List.generate(ingredients_list.length, (index) {
          return Center(
            child: InkWell(
              onTap: () async {
                Map ingredientsIndex = ingredients_list.asMap();
                print("${ingredientsIndex.keys.elementAt(index).toString()}");

                Widget destinationScreen;

                switch (ingredientsIndex.keys.elementAt(index)) {
                  case 0:
                    destinationScreen = const DairyScreen();
                    value;
                    
                    break;
                  case 1:
                    destinationScreen = const FruitScreen();
                    value;
                    break;
                  case 2:
                    destinationScreen = const MeatScreen();
                    value;
                    break;
                  case 3:
                    destinationScreen = const VeggieScreen();
                    value;
                    break;
                  case 4:
                    destinationScreen = const PulseScreen();
                    value;
                    break;
                  case 5:
                    destinationScreen = const SpicesScreen();
                    value;
                    break;
                  case 6:
                    destinationScreen = const DryNutsScreen();
                    value;
                    break;
                  case 7:
                    destinationScreen = const FlourScreen();
                    value;
                    break;
                  case 8:
                    
                    destinationScreen = const ShakesScreen();
                    value;
                    break;
                  default:
                    return;
                }

                final selectedQuantity = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => destinationScreen,  
                  ),
                );

                 if (selectedQuantity != null) {
      prov.setQuantity(index, selectedQuantity);
    }
              },
              child: Select_card(Ingredients: ingredients_list[index],
                             Value: value.length , index: index, location: ingredients_list[index].name, contentData: '', 
                             
                            ),
            ),
          );
        }),
      ),
    );
  }
}
