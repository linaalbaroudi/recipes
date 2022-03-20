import 'package:flutter/material.dart';
import 'package:recipes/widgets/friend_post_list_view.dart';
import '../app_theme.dart';
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
        future: mockService.getExploreData(),
        builder: (context, AsyncSnapshot<ExploreData> snapshot){
          if(snapshot.connectionState == ConnectionState.done){
            //TODO: understand the syntax
            final recipes = snapshot.data?.todayRecipes ?? [];
            final friendPosts = snapshot.data?.friendPosts ?? [];
            return ListView(
              scrollDirection: Axis.vertical,
              children: [
                TodayRecipeListView(recipes: recipes),
                const SizedBox(height: 16),
                // TODO: Replace this with FriendPostListView
                SizedBox(
                  //height: 400,
                  child: FriendPostListView(friendPosts: friendPosts),
                ),
              ],
            );
              //TodayRecipeListView(recipes: recipes);
          }else{
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
    });
  }
}


