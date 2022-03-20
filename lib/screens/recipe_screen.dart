import 'package:flutter/material.dart';
import 'package:recipes/api/mock_fooderlich_service.dart';
import 'package:recipes/models/simple_recipe.dart';
import 'package:recipes/widgets/recipes_grid_view.dart';

class RecipeScreen extends StatelessWidget {
  RecipeScreen({Key? key}) : super(key: key);

  final mockService = MockFooderlichService();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: FutureBuilder(
        future: mockService.getRecipes(),
        builder: (context, AsyncSnapshot<List<SimpleRecipe>> snapshot){
          if(snapshot.connectionState == ConnectionState.done){
            //TODO: understand the syntax
            final recipes = snapshot.data?? [];
            return RecipesGridView(recipes: recipes);
          }else{
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),

    );
  }
}


