import 'package:fluwitter/pages/messages/messages_contract.dart';
import 'package:fluwitter/pages/messages/messages_presenter.dart';
import 'package:flutter/material.dart';

class MessagesView extends MessagesViewContract {

  BuildContext context;
  MessagesPresenter presenter;

  MessagesView(this.context) {
    this.presenter = new MessagesPresenter(this);
  }

  @override
  Widget buildContent() {
    return new Center(
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Text('Messages here.')
        ],
      )
    );
  }

  @override
  void onLoadComplete() {
    print('Load completed.');
  }

}