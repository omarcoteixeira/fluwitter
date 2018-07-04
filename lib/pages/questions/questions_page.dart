import 'package:flutter/material.dart';
import 'package:fluwitter/common/loading_state.dart';

import 'package:fluwitter/pages/questions/questions_strings.dart' as Strings;
import 'package:fluwitter/pages/questions/questions_presenter.dart';
import 'package:fluwitter/pages/questions/questions_view.dart';

class QuestionsPage extends StatefulWidget {

  @override
  State createState() => new QuestionsPageState();

}

class QuestionsPageState extends LoadingBaseState<QuestionsPage> {

  QuestionsView view;
  QuestionsPresenter presenter;

  @override
  void initState() {
    super.initState();
    this.view = new QuestionsView(context);
    this.presenter = new QuestionsPresenter(view);
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