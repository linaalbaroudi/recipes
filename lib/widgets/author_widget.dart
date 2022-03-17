import 'package:flutter/material.dart';
import 'package:recipes/widgets/author_card.dart';
import '../app_theme.dart';
import '../models/models.dart';

class AuthorWidget extends StatelessWidget {
  const AuthorWidget({Key? key, required this.recipe}) : super(key: key);
  final ExploreRecipe recipe;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        constraints: const BoxConstraints.expand(
          height: 450,
          width: 350,
        ),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(recipe.backgroundImage),
            fit: BoxFit.cover,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        child: Column(
          children: [
            AuthorCard(
              authorName: recipe.authorName,
              title: recipe.role,
              imageProvider: AssetImage(recipe.profileImage),
            ),
            Expanded(
              child: Stack(
                children: [
                  Positioned(
                    child: Text(
                      recipe.title,
                      style: FooderlichTheme.lightTextTheme.headline1,
                    ),
                    bottom: 16,
                    right: 16,
                  ),
                  Positioned(
                    child: RotatedBox(
                      quarterTurns: 3,
                      child: Text(
                        recipe.subtitle,
                        style: FooderlichTheme.lightTextTheme.headline1,
                      ),
                    ),
                    bottom: 70,
                    left: 16,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
