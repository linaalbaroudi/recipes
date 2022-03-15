import 'package:flutter/material.dart';
import 'package:recipes/screens/authors_screen.dart';
import 'package:recipes/screens/explore_screen.dart';
import 'package:recipes/screens/recipe_screen.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // Add state variables and functions
  int _selectedIndex = 0;
  static List<Widget> pages = <Widget>[
    const RecipeScreen(),
    const AuthorsScreen(),
    const ExploreScreen()
  ];

  void _onItemTapped(int index){
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // TODO: Style the title
      appBar: AppBar(
        title: Text(widget.title,
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
      // Show selected tab
      body: pages[_selectedIndex],
      // Add bottom navigation bar
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Theme.of(context).textSelectionTheme.selectionColor,
        // Set selected tab bar
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.fastfood),
            label: 'Recipes'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle),
              label: 'Authors'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.book),
              label: 'Explore'
          ),
        ],
      ),
    );
  }
}

