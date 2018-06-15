
import 'package:fluwitter/pages/login/login_strings.dart' as Strings;
import 'package:fluwitter/common/loading_state.dart';
import 'package:fluwitter/pages/login/login_presenter.dart';
import 'package:fluwitter/pages/login/login_view.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {

  @override
  State createState() => new LoginPageState();

}

class LoginPageState extends LoadingBaseState<LoginPage> {

  LoginView view;
  LoginPresenter presenter;

  @override
  void initState() {
    super.initState();
    this.view = new LoginView(context);
    this.presenter = new LoginPresenter(view);
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
    return Strings.loginTitle;
  }

  @override
  bool isUserLogged() {
    return false;
  }

  @override
  AppBar appBar() {
    return new AppBar(
      title: new Text(title())
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