import 'package:flutter/material.dart';
import '../models/models.dart';
import 'friend_post_tile.dart';

class FriendPostListView  extends StatelessWidget {
  const FriendPostListView ({Key? key, required this.friendPosts}) : super(key: key);

  final List<Post> friendPosts;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16,
        right: 16,
        top: 16,),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
              'Social Chefs 👩',
              style: Theme.of(context).textTheme.headline1),
          const SizedBox(height: 16),
          ListView.separated(
            // 2
            primary: false,
            // 3
            physics: const NeverScrollableScrollPhysics(),
            // 4
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemCount: friendPosts.length,
            itemBuilder: (context, index){
              final friendPost = friendPosts[index];
              return FriendPostTile(friendPost: friendPost,);
            },
            separatorBuilder: (context, index){
              return const Divider();
            },
          ),
        ],
      ),
    );
  }
}
