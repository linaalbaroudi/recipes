import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../models/models.dart';
import '../widgets/widgets.dart';

class TodayRecipeListView  extends StatelessWidget {
  const TodayRecipeListView ({Key? key, required this.recipes}) : super(key: key);

  final List<ExploreRecipe> recipes;

  // TODO: Add buildCard() widget here
  Widget recipeCard(ExploreRecipe recipe){
    if(recipe.cardType == RecipeCardType.card1){
      return RecipeCard(recipe: recipe);
    }else if(recipe.cardType == RecipeCardType.card2){
      return AuthorWidget(recipe: recipe);
    }else if(recipe.cardType == RecipeCardType.card3){
      return RecipeTrendsCard(recipe: recipe);
    }else{
      throw Exception("card does not exist yet!");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16,
        right: 16,
        top: 16,),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
              'Recipes of the Day 🍳',
              style: Theme.of(context).textTheme.headline1),
          // 6
          const SizedBox(height: 16),
          // 7
          Container(
            height: 400,
            // TODO: Add ListView Here
            color: Colors.transparent,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: recipes.length,
              itemBuilder: (context, index){
                final recipe = recipes[index];
                return recipeCard(recipe);
              },
              separatorBuilder: (context, index){
                return const SizedBox(width: 16);
              },
            ),
          ),
        ],
      ),
    );
  }
}
