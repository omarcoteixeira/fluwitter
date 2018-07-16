import 'package:fluwitter/components/tweet/tweet.dart';
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
    return new SizedBox.expand(
      child: new ListView.builder(
        itemBuilder: (BuildContext context, int index) => new Tweet(),
        itemCount: 50,
      )
    );
  }

  @override
  void onLoadComplete() {
    print('Load completed.');
  }

}