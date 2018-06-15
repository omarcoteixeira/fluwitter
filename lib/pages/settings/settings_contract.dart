import 'package:flutter/material.dart';

abstract class SettingsViewContract{
  Widget buildContent();

  void onLoadComplete();
}

abstract class SettingsPresenterContract{
  void initView();

  void load();
}