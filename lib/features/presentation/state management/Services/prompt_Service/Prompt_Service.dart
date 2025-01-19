import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:ingredient_cooker/features/model/Recipe_model.dart';
import 'package:ingredient_cooker/features/presentation/pages/Nav_Bar_Pages/Gemini_Response/recipe_Page.dart';
import 'package:ingredient_cooker/features/presentation/state%20management/firebase_provider/uploadDatatoServer.dart';
import 'package:ingredient_cooker/features/presentation/state%20management/home_provider.dart';
import 'package:provider/provider.dart';

class Prompt_Service {
  List<Recipe> Prompt_data = [];

  List<Recipe> get _PromptData => Prompt_data;

  Future<void> CallPromptService(BuildContext context, String location) async {
    final homeprov = Provider.of<HomeProvider>(context, listen: false);
    final responses = Provider.of<UploadDataServer>(context, listen: false);

    final apiKey = 'You-API-Here!';
    final model = GenerativeModel(
      model: 'gemini-1.5-flash-latest',
      apiKey: apiKey,
    );

    final result = await responses.fetch(location);

// final prompt =
//         'Recommend a recipe based on the provided ingredients. The Recipe should only belong to Pakistan or India or Nepal or Bangladesh etc.The recipe should only contain real, edible ingredients. If any some ingredients matches to any recipe, it needs other recipe ingredients then add ingredients from your own. Adhere to food safety and handling best practice like ensuring that poultry is fully cooked. I have following Ingredients $result , to be serve to ${homeprov.valchange} people.Recommend me unlimited Recipes in json format(should be more then 10), if some ingredients belong to making bakery or fast food items or karahi or any thing recommend me every possible recipe from following ingredients. additionally generate images of each, when click on link of image it will directly show image link: imageSource: paste here url of image, optionally you can add more ingredients if any of recipe ingredients is missing. Provide me summery of how many people the recipe will serve. dont explain or use a, an, etc just display recipe and dont talk. if any of recipe contain any drink then make recipe of drinks. add amount of ingredients should be added for per person another thing is please while remember this pattern while generating json: [{"name": "","ingredients":[],"instructions":"","servings": , "imageSource" : ""}], remember dont start with these lines \'\'\'json \'\'\' instead start with json structure ';

    final prompt = '''
Recommend a recipe based on the provided ingredients. The Recipe should only belong to Pakistan, India, Nepal, Bangladesh, etc. The recipe should only contain real, edible ingredients. If some ingredients match any recipe, but it needs other recipe ingredients, then add ingredients from your own. Adhere to food safety and handling best practices, like ensuring that poultry is fully cooked. I have the following ingredients: $result, to serve ${homeprov.valchange} people. Recommend me more than 10 recipes in JSON format (at least 10), and if some ingredients belong to making bakery or fast food items, karahi, or anything else, recommend me every possible recipe from the following ingredients. Additionally, generate images of each; when I click on the image link, it should directly show the image link. Use the field "imageSource" to paste the image URL. Optionally, you can add more ingredients if any recipe ingredients are missing. Provide me a summary of how many people the recipe will serve. Don't explain or use words like "a", "an", etc. Just display the recipes and don't add any extra text. The JSON format should look like this: [{"name": "", "ingredients": [], "instructions": "", "servings": , "imageSource": ""}]. Ensure that the response starts with the JSON structure, without any extra text or markdown.''';

    final content = [Content.text(prompt)];
    final response = await model.generateContent(content);

    try {
      if (response != null && response.text != null) {
        Prompt_data = json.decode(response.text!);
        // Prompt_data = data.map((item) => Recipe.fromJson(item)).toList();
        print('Number of recipes fetched: ${Prompt_data.length}');
      } else {
        print('Error fetching data: ${response.toString()}');
      }
    } catch (e) {
      print('Error fetching data: $e');
    }
    if (Prompt_data.isNotEmpty) {
      print("Response: ${response.text}");
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => RecipeScreen(
            recipes: Prompt_data, // Passing the list of recipes to RecipeScreen
          ),
        ),
      ).then((value) {
        homeprov.no(false);
      }).onError((error, stackTrace) {
        print("Error: $error");
      });
    } else {
      print("no recipe to display");
      homeprov.no(false);
      print("Response: ${response.text}");
    }
  }
}
