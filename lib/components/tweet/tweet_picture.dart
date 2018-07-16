import 'package:flutter/material.dart';

class TweetPicture extends StatefulWidget {
  @override
  State createState() => new TweetPictureState();
}

class TweetPictureState extends State {
  @override
  Widget build(BuildContext context) {
    return new Column(
      children: <Widget>[
        new CircleAvatar(
          backgroundImage: NetworkImage(
              'https://avatars3.githubusercontent.com/u/7129802?s=460&v=4'),
          radius: 25.0,
        )
      ],
    );
  }
}
