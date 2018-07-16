import 'package:flutter/material.dart';
import 'package:fluwitter/components/tweet/tweet_controls.dart';
import 'package:fluwitter/components/tweet/tweet_header.dart';

class TweetContent extends StatefulWidget {
  @override
  State createState() => new TweetContentState();
}

class TweetContentState extends State {
  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: const EdgeInsets.only(top: 4.0),
      child: new Column(
        children: const <Widget>[
          const Text(
            "Current behavior: Hello there this is some text that will overflow 2 lines",
            textAlign: TextAlign.justify,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
          )
        ],
      ),
    );
  }
}
