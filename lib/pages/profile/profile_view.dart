import 'package:fluwitter/pages/profile/profile_contract.dart';
import 'package:fluwitter/pages/profile/profile_presenter.dart';
import 'package:flutter/material.dart';

class ProfileView extends ProfileViewContract {

  BuildContext context;
  ProfilePresenter presenter;

  ProfileView(this.context) {
    this.presenter = new ProfilePresenter(this);
  }

  @override
  Widget buildContent() {
    return new Center(
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Text('Profile here.')
        ],
      )
    );
  }

  @override
  void onLoadComplete() {
    print('Load completed.');
  }

}