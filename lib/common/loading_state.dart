import 'package:flutter/material.dart';

abstract class LoadingBaseState<T extends StatefulWidget> extends State<T> {

  @override
  Widget build(BuildContext context) => new Scaffold(
    appBar: appBar(),
    drawer: drawer(),
    body: isLoading() ? new Center(child: new CircularProgressIndicator()): content(),
    floatingActionButton: floatingActionButton()
  );

  Widget content();
  AppBar appBar();
  Drawer drawer();
  FloatingActionButton floatingActionButton();

  String title();

  bool isLoading();
  bool isUserLogged();
}