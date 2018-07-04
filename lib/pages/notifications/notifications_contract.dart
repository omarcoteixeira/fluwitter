import 'package:flutter/material.dart';

abstract class NotificationsViewContract{
  Widget buildContent();

  void onLoadComplete();
}

abstract class NotificationsPresenterContract{
  void initView();

  void load();
}