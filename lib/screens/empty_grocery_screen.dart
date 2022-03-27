import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../managers/tab_manager.dart';

class EmptyGroceryScreen extends StatelessWidget {
  const EmptyGroceryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Flexible(
          child: AspectRatio(
            aspectRatio: 1/1,
            child: Image.asset('assets/fooderlich_assets/empty_list.png'),
          ),
        ),
        Text('No Groceries',
          style: Theme.of(context).textTheme.headline6,),
        const SizedBox(height: 16.0),
        const Text(
          'Shopping for ingredients?\n'
              'Tap the + button to write them down!',
          textAlign: TextAlign.center,
        ),
        MaterialButton(
          onPressed: (){
            Provider.of<TabManager>(context, listen: false).goToRecipes();
          },
            textColor: Colors.white,
          color: Colors.green,
            child: const Text('Browse Recipes'),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
        )
      ],
    );
  }
}
