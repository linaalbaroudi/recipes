import 'package:flutter/material.dart';
import '../models/models.dart';
import 'package:recipes/widgets/recipe_thumbnail.dart';

class RecipesGridView extends StatelessWidget {
  const RecipesGridView({Key? key, required this.recipes}) : super(key: key);

  final List<SimpleRecipe> recipes;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(
          left: 16,
          right: 16,
          top: 16,
        ),
        // 3
        child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            itemCount: recipes.length,
            itemBuilder: (context, index) {
              final simpleRecipe = recipes[index];
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: RecipeThumbnail(recipe: simpleRecipe),
              );
            }));
  }
}
