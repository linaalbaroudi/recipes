import 'package:flutter/material.dart';
import 'package:recipes/screens/recipe_detail.dart';
import 'package:recipes/models/recipe.dart';
import 'package:recipes/app_theme.dart';

class RecipeScreen extends StatelessWidget {
  const RecipeScreen({Key? key}) : super(key: key);

  Container recipeContainer(Recipe recipe){
    return Container(
      padding: const EdgeInsets.all(16),
      constraints: const BoxConstraints.expand(
        height: 450,
        width: 350,
      ),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(recipe.imageURL),
          fit: BoxFit.cover,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Stack(
        children: [
          Text(
            recipe.category,
            style: FooderlichTheme.darkTextTheme.bodyText1,
          ),
          Positioned(
            child: Text(
              recipe.title,
              style: FooderlichTheme.darkTextTheme.headline5,
            ),
            top: 20,
          ),
          Positioned(
            child: Text(
              recipe.description,
              style: FooderlichTheme.darkTextTheme.bodyText1,
            ),
            bottom: 30,
            right: 0,
          ),
          Positioned(
            child: Text(
              recipe.chef,
              style: FooderlichTheme.darkTextTheme.bodyText1,
            ),
            bottom: 10,
            right: 0,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          itemCount: Recipe.samples.length,
          itemBuilder: (BuildContext context, int index) {
            Widget buildRecipeCard(Recipe recipe) {
              return Card(
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        recipeContainer(recipe),
                        //Image.asset(recipe.imageURL),
                        // Image(
                        //   image: AssetImage(recipe.imageURL),
                        // ),
                        const SizedBox(
                          height: 14,
                        ),
                        Text(
                          recipe.title,
                          style: Theme.of(context).textTheme.headline3,
                        ),
                      ],
                    ),
                  ));
            }

            return GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) {
                        return RecipeDetail(recipe: Recipe.samples[index]);
                      }));
                },
                child: buildRecipeCard(Recipe.samples[index]));
          }),
    );
  }
}


