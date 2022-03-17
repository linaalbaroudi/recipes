import 'package:flutter/material.dart';
import 'package:recipes/home.dart';
//import 'package:flutter/cupertino.dart';
import 'package:recipes/app_theme.dart';

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
    // TODO: Apply Home widget

    return MaterialApp(
      // TODO: Add theme
      title: title,
      theme: theme,
      home: const MyHomePage(title: title),
    );
  }
}


