import 'package:flutter/material.dart';
import 'package:fluwitter/common/loading_state.dart';

import 'package:fluwitter/pages/notifications/notifications_strings.dart' as Strings;
import 'package:fluwitter/pages/notifications/notifications_presenter.dart';
import 'package:fluwitter/pages/notifications/notifications_view.dart';

class NotificationsPage extends StatefulWidget {

  @override
  State createState() => new NotificationsPageState();

}

class NotificationsPageState extends LoadingBaseState<NotificationsPage> {

  NotificationsView view;
  NotificationsPresenter presenter;

  @override
  void initState() {
    super.initState();
    this.view = new NotificationsView(context);
    this.presenter = new NotificationsPresenter(view);
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