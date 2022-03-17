import 'package:flutter/material.dart';
import '../app_theme.dart';
//import '../components/components.dart';
import '../widgets/widgets.dart';
import '../models/models.dart';
import '../api/mock_fooderlich_service.dart';
//import '../widgets/recipe_trends_card.dart';

class ExploreScreen extends StatelessWidget {
  ExploreScreen({Key? key}) : super(key: key);

  final mockService = MockFooderlichService();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: mockService.getExploreData()
        ,builder: (context, AsyncSnapshot<ExploreData> snapshot){
          if(snapshot.connectionState == ConnectionState.done){
            //TODO: understand the syntax
            final recipes = snapshot.data?.todayRecipes ?? [];
            return TodayRecipeListView(recipes: recipes);
          }else{
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
    });
  }
}


