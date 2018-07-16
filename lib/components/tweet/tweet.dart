import 'package:flutter/material.dart';
import 'package:fluwitter/components/tweet/tweet_content.dart';
import 'package:fluwitter/components/tweet/tweet_controls.dart';
import 'package:fluwitter/components/tweet/tweet_header.dart';
import 'package:fluwitter/components/tweet/tweet_picture.dart';

class Tweet extends StatefulWidget {
  @override
  State createState() => new TweetState();
}

class TweetState extends State {
  @override
  Widget build(BuildContext context) {
    return new Card(
        child: new Container(
      width: double.infinity,
      padding: EdgeInsets.all(4.0),
      child: new Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new TweetPicture(),
            new Expanded(
                child: new Container(
              width: double.infinity,
              padding: const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 8.0),

              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new TweetHeader(),
                  new TweetContent(),
                  new TweetControls()
                ],
              ),
            ))
          ]),
    ));
  }
}
