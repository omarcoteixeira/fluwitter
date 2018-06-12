import 'package:fluwitter/pages/home/home_contract.dart';
import 'package:fluwitter/pages/home/home_presenter.dart';
import 'package:flutter/material.dart';

class HomeView extends HomeViewContract {

  BuildContext context;
  HomePresenter presenter;

  HomeView(this.context) {
    this.presenter = new HomePresenter(this);
  }

  @override
  Widget buildContent() {
    return new Center(
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Text('Hi.')
        ],
      )
    );
  }

  @override
  void onLoadComplete() {
    print('Load completed.');
  }

}