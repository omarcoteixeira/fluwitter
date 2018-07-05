
import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_twitter_login/flutter_twitter_login.dart';

import 'package:fluwitter/domain/user_domain.dart';
import 'package:fluwitter/infrastructure/dependency_injection.dart';
import 'package:fluwitter/pages/login/login_contract.dart';
import 'package:fluwitter/pages/login/login_view.dart';
import 'package:fluwitter/pages/login/login_strings.dart' as Strings;

class LoginPresenter extends LoginPresenterContract {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  LoginView view;
  UserDataProvider _userDataProvider;

  FirebaseUser _currentUser;

  TwitterLoginResult _twitterLoginResult;
  TwitterLoginStatus _twitterLoginStatus;
  TwitterSession _currentUserTwitterSession;

  LoginPresenter(this.view) {
    _userDataProvider = new Injector().userDataProvider;
  }

  @override
  initView() {
    this.view.onConfirmCallback = auth;
    this.view.onCancelCallback = cancel;
    this.view.onFacebookLoginClickListener = facebookAuth;
    this.view.onGooglePlusLoginClickListener = googlePlusAuth;
    this.view.onTwitterLoginClickListener = twitterAuth;
  }

  @override
  Future auth() async {
    if (isFormValid()) {
      // var user = await _userDataProvider.auth('xxxxxx');
      this.view.onAuthenticationComplete();
    }
  }

  bool isFormValid(){
    String p = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    var email = this.view.emailController.text.trim();
    var pass = this.view.passController.text;

    RegExp exp = new RegExp(p);
    if(!exp.hasMatch(email)){
      this.view.showInfoPopup(Strings.emailError);
      return false;
    }

    if(pass.length<6){
      this.view.showInfoPopup(Strings.passError);
      return false;
    }
    
    return true;
  }

  @override
  void cancel() {
    // TODO: implement cancel
  }

  @override
  void confirm() {
    // TODO: implement confirm
  }

  @override
  Future facebookAuth() async{
    print('Facebook Login Listener');
  }

  @override
  Future googlePlusAuth() async{
    print('Google Plus Login Listener');
  }

  @override
  Future twitterAuth() async{
    print('Twitter Login Listener');
    var twitterLogin = new TwitterLogin(
      consumerKey: String.fromEnvironment("TWITTER_COMSUMER_KEY"),
      consumerSecret: String.fromEnvironment("TWITTER_COMSUMER_SECRET"),
    );

    _twitterLoginResult = await twitterLogin.authorize();

    switch (_twitterLoginResult.status) {
      case TwitterLoginStatus.loggedIn:
        this.view.isLoading = true;

        _handleTwitterSignin()
          .then((FirebaseUser user) {
            this.view.isLoading = false;
            this.view.onAuthenticationComplete();
          });
        break;
      case TwitterLoginStatus.cancelledByUser:
        break;
      case TwitterLoginStatus.error:
        print("Error on trying to authenticate the twitter user");
        break;
    }
  }

  Future<FirebaseUser> _handleTwitterSignin() async {
    _currentUserTwitterSession = _twitterLoginResult.session;
    _twitterLoginStatus = _twitterLoginResult.status;
    
    FirebaseUser authenticatedUser = await _firebaseAuth.signInWithTwitter(
        authToken: _currentUserTwitterSession?.token ?? '',
        authTokenSecret: _currentUserTwitterSession?.secret ?? ''
    );

    assert(authenticatedUser.email != null);
    assert(authenticatedUser.displayName != null);

    return authenticatedUser;
  }
}