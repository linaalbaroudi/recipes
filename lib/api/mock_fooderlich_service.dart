import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/models.dart';

// Mock recipe service that grabs sample json data to mock recipe request/response
class MockFooderlichService{

  // Get the sample recipe json to display in ui
  Future<List<SimpleRecipe>> getRecipes() async{

    // Simulate api request wait time
    await Future.delayed(const Duration(milliseconds: 100));

    // Load json from file system
    final dataString = await _loadAsset('assets/sample_data/sample_recipes.json');
    // Decode to json
    final Map<String, dynamic> json = jsonDecode(dataString);

    // Go through each recipe and convert json to SimpleRecipe object.
    if(json['recipes'] != null){
      final recipes = <SimpleRecipe>[];
      json['recipes'].forEach((recipe){
        recipes.add(SimpleRecipe.fromJson(recipe));
      });
      return recipes;
    }else{
      return [];
    }
  }

  // Batch request that gets both today recipes and friend's feed
  Future<ExploreData> getExploreData() async{
    final todayRecipes = await _getTodayRecipes();
    final friendPosts = await _getFriendPosts();

    return ExploreData(todayRecipes, friendPosts);
  }

  // Get sample explore recipes json to display in ui
  Future<List<ExploreRecipe>> _getTodayRecipes() async{

    // Simulate api request wait time
    await Future.delayed(const Duration(milliseconds: 1000));

    // Load json from file system
    final dataString = await _loadAsset('assets/sample_data/sample_explore_recipes.json');
    // Decode to json
    final Map<String, dynamic> json = jsonDecode(dataString);

    // Go through each recipe and convert json to SimpleRecipe object.
    if(json['recipes'] != null){
      final recipes = <ExploreRecipe>[];
      json['recipes'].forEach((recipe){
        recipes.add(ExploreRecipe.fromJson(recipe));
      });
      return recipes;
    }else{
      return [];
    }
  }

  // Get the sample friend json posts to display in ui
  Future<List<Post>> _getFriendPosts() async{

    // Simulate api request wait time
    await Future.delayed(const Duration(milliseconds: 1000));

    // Load json from file system
    final dataString = await _loadAsset('assets/sample_data/sample_friends_feed.json');
    // Decode to json
    final Map<String, dynamic> json = jsonDecode(dataString);

    // Go through each recipe and convert json to SimpleRecipe object.
    if(json['feed'] != null){
      final posts = <Post>[];
      json['feed'].forEach((post){
        posts.add(Post.fromJson(post));
      });
      return posts;
    }else{
      return [];
    }
  }

  // Loads sample json data from file system
  Future<String> _loadAsset(String path) async{
    String data = await rootBundle.loadString(path);
    return data;
  }

}