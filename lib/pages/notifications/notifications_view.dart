import 'package:fluwitter/pages/notifications/notifications_contract.dart';
import 'package:fluwitter/pages/notifications/notifications_presenter.dart';
import 'package:flutter/material.dart';

class NotificationsView extends NotificationsViewContract {

  BuildContext context;
  NotificationsPresenter presenter;

  NotificationsView(this.context) {
    this.presenter = new NotificationsPresenter(this);
  }

  @override
  Widget buildContent() {
    return new Center(
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Text('Notifications here.')
        ],
      )
    );
  }

  @override
  void onLoadComplete() {
    print('Load completed.');
  }

}