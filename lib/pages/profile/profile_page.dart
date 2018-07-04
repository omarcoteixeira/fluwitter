import 'package:flutter/material.dart';
import 'package:fluwitter/common/loading_state.dart';

import 'package:fluwitter/pages/profile/profile_strings.dart' as Strings;
import 'package:fluwitter/pages/profile/profile_presenter.dart';
import 'package:fluwitter/pages/profile/profile_view.dart';

class ProfilePage extends StatefulWidget {

  @override
  State createState() => new ProfilePageState();

}

class ProfilePageState extends LoadingBaseState<ProfilePage> {

  ProfileView view;
  ProfilePresenter presenter;

  @override
  void initState() {
    super.initState();
    this.view = new ProfileView(context);
    this.presenter = new ProfilePresenter(view);
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