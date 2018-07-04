import 'package:fluwitter/pages/search/search_contract.dart';
import 'package:fluwitter/pages/search/search_presenter.dart';
import 'package:flutter/material.dart';

class SearchView extends SearchViewContract {

  BuildContext context;
  SearchPresenter presenter;

  SearchView(this.context) {
    this.presenter = new SearchPresenter(this);
  }

  @override
  Widget buildContent() {
    return new Center(
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Text('Search here.')
        ],
      )
    );
  }

  @override
  void onLoadComplete() {
    print('Load completed.');
  }

}