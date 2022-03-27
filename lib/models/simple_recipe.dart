class SimpleRecipe{
  String id;
  String dishImage;
  String title;
  String duration;
  String source;
  List<String> information;
  List<Ingredient> ingredients = [
    Ingredient(1, 'box', 'Spaghetti',),
    Ingredient(4, '', 'Frozen Meatballs',),
    Ingredient(0.5, 'jar', 'sauce',),
  ];

  SimpleRecipe({
    required this.id,
    required this.dishImage,
    required this.title,
    required this.duration,
    required this.source,
    required this.information,
  });

  factory SimpleRecipe.fromJson(Map<String, dynamic> json){
    return SimpleRecipe(
      id: json['id'] as String,
      dishImage: json['dishImage'] as String,
      title: json['title'] as String,
      duration: json['duration'] as String,
      source: json['source'] as String,
      information: json['information'].cast<String>() as List<String>
    );
  }
}

class Ingredient {
  String name;
  double quantity;
  String measure;

  Ingredient(
      this.quantity,
      this.measure,
      this.name,
      );
}