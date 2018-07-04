import 'package:fluwitter/pages/questions/questions_contract.dart';
import 'package:fluwitter/pages/questions/questions_presenter.dart';
import 'package:flutter/material.dart';

class QuestionsView extends QuestionsViewContract {

  BuildContext context;
  QuestionsPresenter presenter;

  QuestionsView(this.context) {
    this.presenter = new QuestionsPresenter(this);
  }

  @override
  Widget buildContent() {
    return new Center(
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Text('Questions here.')
        ],
      )
    );
  }

  @override
  void onLoadComplete() {
    print('Load completed.');
  }

}