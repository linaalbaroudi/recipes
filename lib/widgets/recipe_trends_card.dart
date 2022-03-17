import 'package:flutter/material.dart';
import 'package:recipes/app_theme.dart';
import '../models/models.dart';

class RecipeTrendsCard extends StatefulWidget {
  const RecipeTrendsCard({Key? key, required this.recipe}) : super(key: key);

  final ExploreRecipe recipe;

  @override
  State<RecipeTrendsCard> createState() => _RecipeTrendsCardState();
}

class _RecipeTrendsCardState extends State<RecipeTrendsCard> {

  List<Chip> tagsChips(){
    final chips =  <Chip>[];
    widget.recipe.tags.forEach((element) {
      final chip =  Chip(
        label: Text(
            element,
            style: FooderlichTheme.darkTextTheme.bodyText1
        ),
        backgroundColor: Colors.black.withOpacity(0.7),
      );
      chips.add(chip);
    });
    return chips;
  }

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
            image: AssetImage(widget.recipe.backgroundImage),
            fit: BoxFit.cover,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        child: Stack(
          children: [
            // add dark overlay BoxDecoration
            Container(
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.6),
                borderRadius: const BorderRadius.all(Radius.circular(10)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(Icons.book, size: 30,color: Colors.white,),
                  const SizedBox(height: 8),
                  Text(
                    widget.recipe.title,
                    style: FooderlichTheme.darkTextTheme.headline2,
                  ),
                  const SizedBox(height: 8),
                  Center(
                    child: Wrap(
                      alignment: WrapAlignment.start,
                      spacing: 12,
                      runSpacing: 12,
                      children: tagsChips()
                    ),
                  )
                ],
              ),
            ),
            // TODO 7: Add Center widget with Chip widget children
          ],
        ),

      ),
    );
  }
}
