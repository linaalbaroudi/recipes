import 'package:flutter/material.dart';
import 'package:recipes/screens/explore_screen.dart';
import 'package:recipes/screens/grocery_screen.dart';
import 'package:recipes/screens/recipe_screen.dart';
import 'package:provider/provider.dart';
import 'managers/tab_manager.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  static List<Widget> pages = <Widget>[
    ExploreScreen(),
    RecipeScreen(),
    const GroceryScreen()
  ];

  // these are replaced by tabManager provider
  //int _selectedIndex = 0;

  // void _onItemTapped(int index){
  //   setState(() {
  //     _selectedIndex = index;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Consumer<TabManager>(
      builder: (context, tabManager, child){
        return Scaffold(
          appBar: AppBar(
            title: Text(widget.title,
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          // Show selected tab
          body: pages[tabManager.selectedTab],
          // Add bottom navigation bar
          bottomNavigationBar: BottomNavigationBar(
            unselectedItemColor: Colors.grey,
            selectedItemColor: Theme.of(context).textSelectionTheme.selectionColor,
            showUnselectedLabels: true,
            // Set selected tab bar
            currentIndex: tabManager.selectedTab,
            onTap: (index){
              tabManager.goToTab(index);
            },
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                  icon: Icon(Icons.explore),
                  label: 'Explore'
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.book),
                label: 'Recipes',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.list),
                label: 'To Buy',
              ),
            ],
          ),
        );
      },
    );

  }
}

