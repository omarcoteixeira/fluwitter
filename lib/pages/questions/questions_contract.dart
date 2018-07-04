import 'package:flutter/material.dart';

abstract class QuestionsViewContract{
  Widget buildContent();

  void onLoadComplete();
}

abstract class QuestionsPresenterContract{
  void initView();

  void load();
}