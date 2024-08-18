class Recipe {
  final String name;
  final List<String> ingredients;
  final String instructions;
  final int servings;
  final String imageSource;

  Recipe({
    required this.name,
    required this.ingredients,
    required this.instructions,
    required this.servings,
    required this.imageSource,
  });

  factory Recipe.fromJson(Map<String, dynamic> json) {
    return Recipe(
      name: json['name'],
      ingredients: List<String>.from(json['ingredients']),
      instructions: json['instructions'],
      servings: json['servings'],
      imageSource: json['imageSource'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'ingredients': ingredients,
      'instructions': instructions,
      'servings': servings,
      'imageSource': imageSource,
    };
  }
}
