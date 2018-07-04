import 'package:flutter/material.dart';
import 'package:fluwitter/common/loading_state.dart';

import 'package:fluwitter/pages/messages/messages_strings.dart' as Strings;
import 'package:fluwitter/pages/messages/messages_presenter.dart';
import 'package:fluwitter/pages/messages/messages_view.dart';

class MessagesPage extends StatefulWidget {

  @override
  State createState() => new MessagesPageState();

}

class MessagesPageState extends LoadingBaseState<MessagesPage> {

  MessagesView view;
  MessagesPresenter presenter;

  @override
  void initState() {
    super.initState();
    this.view = new MessagesView(context);
    this.presenter = new MessagesPresenter(view);
    this.presenter.initView();
  }

  @override
  Widget content() {
    return new Center(
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          view.buildContent()
        ],
      ),
    );
  }

  @override
  bool isLoading() {
    return false;
  }

  @override
  String title() {
    return Strings.title;
  }

  @override
  bool isUserLogged() {
    return true;
  }

  @override
  AppBar appBar() {
    return new AppBar(
      title: new Text(title()),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.tune),
          onPressed: () {
            print('Filter button');
          },
        ),
      ],
    );
  }

  @override
  FloatingActionButton floatingActionButton() {
    return new FloatingActionButton(
      child: new Icon(Icons.add),
      onPressed: (){}
    );
  }
}