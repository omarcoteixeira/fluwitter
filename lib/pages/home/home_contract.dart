import 'package:flutter/material.dart';

abstract class HomeViewContract{
  Widget buildContent();

  void onLoadComplete();
}

abstract class HomePresenterContract{
  void initView();

  void load();
}