import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recipes/screens/empty_grocery_screen.dart';
import 'package:provider/provider.dart';
import 'package:recipes/managers/managers.dart';
import 'grocery_item_screen.dart';
import 'grocery_list_screen.dart';

class GroceryScreen extends StatelessWidget {
  const GroceryScreen({Key? key}) : super(key: key);

  Widget buildGroceryScreen() {
    // 1
    return Consumer<GroceryManager>(
      // 2
      builder: (context, manager, child) {
        // 3
        if (manager.groceryList.isNotEmpty) {
          return GroceryListScreen(groceryManager: manager,);
        } else {
          // 4
          return const EmptyGroceryScreen();
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          final manager = Provider.of<GroceryManager>(context, listen: false);
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => GroceryItemScreen(
                  onCreate: (item) {
                    manager.addItem(item);
                    Navigator.pop(context);
                  },
                  onUpdate: (item) {}),
            ),
          );
        },
      ),
      body: buildGroceryScreen(),
    );
  }
}
