import 'package:flutter/material.dart';
import 'package:recipes/app_theme.dart';
import 'package:recipes/models/post.dart';
import 'circle_image.dart';

class FriendPostTile  extends StatelessWidget {
  const FriendPostTile  ({Key? key, required this.friendPost}) : super(key: key);

  final Post friendPost;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CircleImage(
              imageProvider: AssetImage(friendPost.profileImageUrl),
              imageRadius: 28,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(friendPost.comment),
                  Text(friendPost.timestamp+" mins ago",
                    style: const TextStyle(fontWeight: FontWeight.w700)),
                ],
              ),
            )
          ],
        ),
    );
  }
}

