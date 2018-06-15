import 'package:flutter/material.dart';

import 'package:fluwitter/common/loading_state.dart';

import 'package:fluwitter/pages/settings/settings_strings.dart' as Strings;
import 'package:fluwitter/pages/settings/settings_presenter.dart';
import 'package:fluwitter/pages/settings/settings_view.dart';

class SettingsPage extends StatefulWidget {

  @override
  State createState() => new SettingsPageState();

}

class SettingsPageState extends LoadingBaseState<SettingsPage> {

  SettingsView view;
  SettingsPresenter presenter;

  @override
  void initState() {
    super.initState();
    this.view = new SettingsView(context);
    this.presenter = new SettingsPresenter(view);
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
      actions: <Widget>[],
    );
  }

  @override
  Drawer drawer() {
    return null;
  }

  @override
  FloatingActionButton floatingActionButton() {
    return null;
  }
}