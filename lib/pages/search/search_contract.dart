import 'package:flutter/material.dart';

abstract class SearchViewContract{
  Widget buildContent();

  void onLoadComplete();
}

abstract class SearchPresenterContract{
  void initView();

  void load();
}