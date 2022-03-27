import 'package:flutter/material.dart';
import 'package:recipes/managers/grocery_manager.dart';
import '../widgets/grocery_tile.dart';
import '../models/models.dart';
import 'grocery_item_screen.dart';

class GroceryListScreen extends StatelessWidget {
  const GroceryListScreen({Key? key, required this.groceryManager}) : super(key: key);

  final GroceryManager groceryManager;

  @override
  Widget build(BuildContext context) {
    // add the items list here to update every time the widget is rebuilt
    final groceryList = groceryManager.groceryList;

    return Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.separated(
            itemBuilder: (context, index){
              final item = groceryList[index];
              // TODO 28: Wrap in a Dismissable
              // TODO 27: Wrap in an InkWell
              return GroceryTile(
                key: Key(item.id),
                item: item,
                onComplete: (change){
                  if(change != null){
                    groceryManager.completeItem(index, change);
                  }
                },);
            },
            separatorBuilder: (context, index){
              return const SizedBox(height: 16.0);
            },
            itemCount: groceryList.length,
        ),
    );
  }
}
