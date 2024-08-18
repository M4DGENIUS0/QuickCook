import 'package:flutter/material.dart';
import 'package:ingredient_cooker/features/model/Recipe_model.dart';
import 'package:ingredient_cooker/features/presentation/pages/Nav_Bar_Pages/Gemini_Response/RecipeDetailScreen.dart';
import 'package:ingredient_cooker/features/presentation/widgets/RecipeGrid/RecipieGridCard.dart';

class RecipeScreen extends StatefulWidget {
  final List<Recipe> recipes;

  const RecipeScreen({Key? key, required this.recipes}) : super(key: key);

  @override
  State<RecipeScreen> createState() => _RecipeScreenState();
}

class _RecipeScreenState extends State<RecipeScreen> {
  @override
  Widget build(BuildContext context) {
      print('Number of recipes: ${widget.recipes.length}'); 
    
  return Scaffold(
    appBar: AppBar(
      title: Text('Recipes'),
    ),
    body: widget.recipes.isEmpty
        ? Center(child: Text('No recipes available'))
        : GridView.builder(
            padding: const EdgeInsets.all(10),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // Number of columns in the grid
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childAspectRatio: 0.75,
            ),
            itemCount: widget.recipes.length,
            itemBuilder: (context, index) {
              final recipe = widget.recipes[index];
              return RecipeGridcard(
                title: recipe.name,
                image: recipe.imageSource,
                Description: 'Serves ${recipe.servings}',
                tap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => RecipeDetailScreen(recipe: recipe),
                    ),
                  );
                },
                cardColor: Colors.white,
                textColor: Colors.black,
                DescriptionColor: Colors.grey,
              );
            },
          ));
          }
}