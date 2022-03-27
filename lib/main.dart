import 'package:flutter/material.dart';
import 'package:recipes/home.dart';
import 'package:recipes/app_theme.dart';
import 'package:provider/provider.dart';
import 'package:recipes/managers/managers.dart';

void main() {
  runApp(const RecipeApp());
}

class RecipeApp extends StatelessWidget {
  const RecipeApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const String title = 'Food Rich';

    // Create theme
    final ThemeData theme = FooderlichTheme.light();

    return MaterialApp(
      title: title,
      theme: theme,
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context)=> TabManager()),
          ChangeNotifierProvider(create: (context)=> GroceryManager())
        ],
        child: const MyHomePage(title: title),
      ),
    );
  }
}


