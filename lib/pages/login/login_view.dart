import 'package:fluwitter/pages/login/login_presenter.dart';
import 'package:fluwitter/pages/login/login_strings.dart' as Strings;
import 'package:fluwitter/common/dialog_shower.dart' as DialogShower;
import 'package:fluwitter/images.dart' as Images;
import 'package:flutter/material.dart';
import 'login_contract.dart';

class LoginView extends LoginViewContract {

  final TextEditingController _emailController = new TextEditingController();
  final TextEditingController _passController = new TextEditingController();

  bool isLoading = false;
  BuildContext context;
  LoginPresenterContract presenter;
  VoidCallback _onConfirmCallback;
  VoidCallback _onFacebookLoginClickListener;
  VoidCallback _onGooglePlusLoginClickListener;
  VoidCallback _onTwitterLoginClickListener;
  VoidCallback _onCancelCallback;

  LoginView(this.context) {
    this.presenter = new LoginPresenter(this);
  }

  @override
  Widget buildContent() {
    return new Center(
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          // emailTextField(),
          // passwordTextField(),
          // new ButtonBar(
          //   children: <Widget>[
          //     confirmButton(_onConfirmCallback)
          //   ]
          // ),
          twitterLoginButton(_onTwitterLoginClickListener),
        ],
      ),
    );
  }

  Widget emailTextField() => new Container(
    alignment: new Alignment(0.5, 0.5),
    margin: const EdgeInsets.only(left: 16.0,right: 16.0,bottom: 16.0),
    padding: const EdgeInsets.symmetric(horizontal: 8.0),
    child: new TextField(
      controller: _emailController,
      decoration: new InputDecoration(
        labelText: Strings.emailHint
      ),
      keyboardType: TextInputType.emailAddress,
    ),
  );

  Widget passwordTextField() => new Container(
    alignment: new Alignment(0.5, 0.5),
    margin: const EdgeInsets.only(left: 16.0,right: 16.0,bottom: 16.0),
    padding: const EdgeInsets.symmetric(horizontal: 8.0),
    child: new TextField(
      obscureText: true,
      controller: _passController,
      decoration: new InputDecoration(
        labelText: Strings.passwordHint
      ),
    ),
  );

  Widget confirmButton(VoidCallback callback) => 
    new Padding(padding: new EdgeInsets.all(2.0),
      child: new RaisedButton(
          color: new Color(0xff64B5F6),
          elevation: 8.0,
          onPressed: callback,
          child: new Text(
            Strings.loginButton,
            style: new TextStyle(
                color: new Color(0xffffffff)
            ),
          )
      )
    );

  Widget twitterLoginButton(VoidCallback callback) {
    var assetImage = new AssetImage(Images.twitterIcon);

    return new Padding(padding: new EdgeInsets.all(8.0),
      child: new RaisedButton(
          color: new Color(0xFF00ACED),
          onPressed: callback,
          child: new Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              new Image(image: assetImage, height: 24.0, width: 24.0),
              new Padding(padding: const EdgeInsets.only(right: 8.0)),
              new Text(Strings.twitterLoginButton,
                style: new TextStyle(
                  color: new Color(0xffffffff)
                )
              ),
            ],
          )
      )
    );
  }
    
  @override
  void showInfoPopup(String message) {
    var dialog = DialogShower.buildDialog(
        message: message,
        confirm: Strings.ok,
        confirmFn: () => Navigator.pop(context));
    showDialog(context: context, child: dialog);
  }

  @override
  set onConfirmCallback(VoidCallback value) {
    _onConfirmCallback = value;
  }

  @override
  set onCancelCallback(VoidCallback value) {
    _onCancelCallback = value;
  }

  @override
  set onFacebookLoginClickListener(VoidCallback value) {
    _onFacebookLoginClickListener = value;
  }

  @override
  set onGooglePlusLoginClickListener(VoidCallback value) {
    _onGooglePlusLoginClickListener = value;
  }

  @override
  set onTwitterLoginClickListener(VoidCallback value) {
    _onTwitterLoginClickListener = value;
  }

  @override
  void onAuthenticationComplete() {
    print('Authenticated');
    Navigator.of(context).pop();
    Navigator.of(context).pushNamed('/home');
  }

  TextEditingController get emailController => _emailController;
  TextEditingController get passController => _passController;
  VoidCallback get onConfirmCallback => _onConfirmCallback;
  VoidCallback get onFacebookLoginClickListener => _onFacebookLoginClickListener;
  VoidCallback get onGooglePlusLoginClickListener => _onGooglePlusLoginClickListener;
  VoidCallback get onTwitterLoginClickListener => _onTwitterLoginClickListener;
  VoidCallback get onCancelCallback => _onCancelCallback;
}