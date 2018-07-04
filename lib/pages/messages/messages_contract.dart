import 'package:flutter/material.dart';

abstract class MessagesViewContract{
  Widget buildContent();

  void onLoadComplete();
}

abstract class MessagesPresenterContract{
  void initView();

  void load();
}