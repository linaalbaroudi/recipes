import 'package:flutter/material.dart';
import 'package:recipes/widgets/author_card.dart';
import '../app_theme.dart';


class AuthorsScreen extends StatelessWidget {
  const AuthorsScreen({Key? key}) : super(key: key);

  Container authorContainer(){
    return Container(
      constraints: const BoxConstraints.expand(
        height: 450,
        width: 350,
      ),
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/mag5.png'),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        children: [
          const AuthorCard(
            authorName: 'Mike Katz',
            title: 'Smoothie Connoisseur',
            imageProvider: AssetImage('assets/author_katz.jpeg'),
          ),
          Expanded(
              child: Stack(
                children: [
                  Positioned(
                    child: Text(
                      'Recipe',
                      style: FooderlichTheme.lightTextTheme.headline1,
                    ),
                    bottom: 16,
                    right: 16,
                  ),
                  Positioned(
                    child: RotatedBox(
                      quarterTurns: 3,
                      child: Text(
                        'Smoothies',
                        style: FooderlichTheme.lightTextTheme.headline1,
                      ),
                    ),
                    bottom: 70,
                    left: 16,
                  ),
                ],
              ),
          )
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


