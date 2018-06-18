import 'dart:async';
import 'package:flutter/material.dart';

abstract class LoginViewContract{

  Widget buildContent();

  void showInfoPopup(String message);
  

  TextEditingController get emailController;
  TextEditingController get passController;

  void onAuthenticationComplete();
  set onConfirmCallback(VoidCallback value);
  set onCancelCallback(VoidCallback value);
  set onFacebookLoginClickListener(VoidCallback value);
  set onGooglePlusLoginClickListener(VoidCallback value);
  set onTwitterLoginClickListener(VoidCallback value);
}

abstract class LoginPresenterContract{
  void initView();

  Future auth();
  Future facebookAuth();
  Future googlePlusAuth();
  Future twitterAuth();
  
  void confirm();
  void cancel();
}