import 'package:flutter/material.dart';
import 'package:recipes/models/grocery_item.dart';

class GroceryManager extends ChangeNotifier{
  final _groceryList = <GroceryItem>[];

  List<GroceryItem> get groceryList => List.unmodifiable(_groceryList);

  void deleteItem(int index){
    if(_groceryList.isNotEmpty){
      _groceryList.removeAt(index);
      notifyListeners();
    }
  }

  void addItem(GroceryItem groceryItem){
    _groceryList.add(groceryItem);
    notifyListeners();
  }

  void updateItem(GroceryItem groceryItem, int index){
    if(_groceryList.length-1 >= index){
      _groceryList[index] = groceryItem;
      notifyListeners();
    }
  }

  void completeItem(int index, bool change){
    if(_groceryList.length-1 >= index){
      final groceryItem = _groceryList[index];
      _groceryList[index] = groceryItem.copyWith(isComplete: change);
      notifyListeners();
    }
  }
}