import 'package:flutter/material.dart';
import 'package:recipes/app_theme.dart';
import 'circle_image.dart';

class AuthorCard extends StatefulWidget {
  const AuthorCard({Key? key, required this.authorName, required this.title, required this.imageProvider}) : super(key: key);

  //declare here values wont change
  final String authorName;
  final String title;
  final ImageProvider? imageProvider;

  @override
  State<AuthorCard> createState() => _AuthorCardState();
}

class _AuthorCardState extends State<AuthorCard> {

  // declare here mutable -changing- values
  bool _isFavorited = false;

  @override
  Widget build(BuildContext context) {
    // TODO: Replace return Container(...);
    return Container(
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleImage(
                imageProvider: widget.imageProvider,
                imageRadius: 28,
              ),
              const SizedBox(width: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.authorName,
                  style: FooderlichTheme.lightTextTheme.headline2,),
                  Text(widget.title,
                    style: FooderlichTheme.lightTextTheme.headline3,),
                ],
              )
            ],
          ),
          // TODO 2: add IconButton
          IconButton(
            onPressed: (){
              const snackBar = SnackBar(content: Text('Favorite Pressed'),);
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
              setState(() {
                 _isFavorited = !_isFavorited;
              });
            },
            icon: Icon( _isFavorited ? Icons.favorite : Icons.favorite_border),
            iconSize: 30,
            color: _isFavorited? Colors.red : Colors.grey[400],
          ),
        ],
      ),
    );
  }
}
