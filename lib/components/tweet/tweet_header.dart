import 'package:flutter/material.dart';
import 'package:fluwitter/images.dart' as Images;

class TweetHeader extends StatefulWidget {
  @override
  State createState() => new TweetHeaderState();
}

class TweetHeaderState extends State {
  @override
  Widget build(BuildContext context) {
    return new Row(
      children: <Widget>[
        new Container(
          child: new Text(
            "Marco Túlio Teixeira",
            style: new TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        new Container(
          padding: const EdgeInsets.only(left: 4.0),
          child: new Image(
              image: new AssetImage(Images.verifiedIcon),
              color: Colors.blue,
              height: 14.0,
              width: 14.0),
        ),
        new Container(
            padding: const EdgeInsets.only(left: 6.0),
            child: new Text('omarcoteixeira',
                style: new TextStyle(color: new Color(0xFF808080))))
      ],
    );
  }
}
