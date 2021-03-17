import 'package:flutter/material.dart';
import 'package:flutter_auth/model/response/post_model.dart';

class PostView extends StatelessWidget {
  final PostModel post;

  PostView({@required this.post});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.blueAccent),
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
          boxShadow: kElevationToShadow[2]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            post.title,
            style: TextStyle(
                color: Colors.black38,
                fontWeight: FontWeight.bold,
                fontSize: 20),
          ),
          SizedBox(height: 8,),
          Text(post.body, maxLines: 2,)
        ],
      ),
    );
  }

}