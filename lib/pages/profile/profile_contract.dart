import 'package:flutter/material.dart';

abstract class ProfileViewContract{
  Widget buildContent();

  void onLoadComplete();
}

abstract class ProfilePresenterContract{
  void initView();

  void load();
}