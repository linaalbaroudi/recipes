import 'package:flutter/material.dart';
import 'package:recipes/screens/recipe_detail.dart';

import '../app_theme.dart';
import '../models/models.dart';

class RecipeThumbnail extends StatelessWidget {
  const RecipeThumbnail({Key? key, required this.recipe}) : super(key: key);

  final SimpleRecipe recipe;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              // 10
              // TODO: Replace return with return RecipeDetail()
              return RecipeDetail(recipe: recipe);
            },
          ),
        );
      },
      child: Container(
        //padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.6),
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              // 5
              child: ClipRRect(
                child: Image.asset(
                  recipe.dishImage,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: 10),
            // 7
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                recipe.title,
                maxLines: 1,
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  const Icon(
                    Icons.schedule_rounded,
                  ),
                  const SizedBox(
                    width: 6,
                  ),
                  Text(
                    recipe.duration,
                    style: Theme.of(context).textTheme.bodyText1,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
