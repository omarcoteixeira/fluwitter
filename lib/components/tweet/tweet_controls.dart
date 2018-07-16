import 'package:flutter/material.dart';

class TweetControls extends StatefulWidget {
  @override
  State createState() => new TweetControlsState();
}

class TweetControlsState extends State {
  @override
  Widget build(BuildContext context) {
    return new Container(
        padding: const EdgeInsets.only(top: 16.0),
        child: new Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            new GestureDetector(
                child: new Icon(Icons.chat_bubble_outline, size: 16.0)),
            new GestureDetector(child: new Icon(Icons.repeat, size: 16.0)),
            new GestureDetector(
                child: new Icon(Icons.favorite_border, size: 16.0)),
            new GestureDetector(child: Icon(Icons.share, size: 16.0))
          ],
        ));
  }
}
