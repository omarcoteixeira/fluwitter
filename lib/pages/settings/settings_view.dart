import 'package:fluwitter/pages/settings/settings_contract.dart';
import 'package:fluwitter/pages/settings/settings_presenter.dart';
import 'package:flutter/material.dart';

class SettingsView extends SettingsViewContract {

  BuildContext context;
  SettingsPresenter presenter;

  SettingsView(this.context) {
    this.presenter = new SettingsPresenter(this);
  }

  @override
  Widget buildContent() {
    return new Center(
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Text('Settings.')
        ],
      )
    );
  }

  @override
  void onLoadComplete() {
    print('Load completed.');
  }

}