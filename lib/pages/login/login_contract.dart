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
}

abstract class LoginPresenterContract{
  void initView();

  void auth();
  void facebookAuth();
  void googlePlusAuth();
  void confirm();
  void cancel();
}