import 'package:flutter/material.dart';
import '../app_theme.dart';


class ExploreScreen extends StatelessWidget {
  const ExploreScreen({Key? key}) : super(key: key);

  Container authorContainer(){
    return Container(
      constraints: const BoxConstraints.expand(
        height: 450,
        width: 350,
      ),
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/mag2.png'),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Stack(
        children: [
          // add dark overlay BoxDecoration
          Container(
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.6),
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(Icons.book, size: 30,),
                const SizedBox(height: 8),
                Text(
                  'Recipe Trends',
                  style: FooderlichTheme.darkTextTheme.headline2,
                ),
                const SizedBox(height: 8),
                Center(
                  child: Wrap(
                    alignment: WrapAlignment.spaceAround,
                    spacing: 12,
                    runSpacing: 12,
                    children: [
                      Chip(
                        label: Text(
                          'Healthy',
                            style: FooderlichTheme.darkTextTheme.bodyText1
                        ),
                        backgroundColor: Colors.black.withOpacity(0.7),
                        onDeleted: () {
                          print('delete');
                        },
                      ),
                      Chip(
                        label: Text(
                            'Vegan',
                            style: FooderlichTheme.darkTextTheme.bodyText1
                        ),
                        backgroundColor: Colors.black.withOpacity(0.7),
                      ),
                      Chip(
                        label: Text(
                            'Carrots',
                            style: FooderlichTheme.darkTextTheme.bodyText1
                        ),
                        backgroundColor: Colors.black.withOpacity(0.7),
                        onDeleted: () {
                          print('delete');
                        },
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          // TODO 7: Add Center widget with Chip widget children
        ],
      ),

    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Center(
          child: authorContainer(),
        )
    );
  }
}


