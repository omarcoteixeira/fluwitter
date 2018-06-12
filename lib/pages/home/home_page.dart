
import 'package:fluwitter/pages/home/home_strings.dart' as Strings;
import 'package:fluwitter/common/loading_state.dart';
import 'package:fluwitter/pages/home/home_presenter.dart';
import 'package:fluwitter/pages/home/home_view.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {

  @override
  State createState() => new HomePageState();

}

class HomePageState extends LoadingBaseState<HomePage> {

  HomeView view;
  HomePresenter presenter;

  @override
  void initState() {
    super.initState();
    this.view = new HomeView(context);
    this.presenter = new HomePresenter(view);
    this.presenter.initView();
  }

  @override
  Widget content() {
    return new Center(
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          view.buildContent()
        ],
      ),
    );
  }

  @override
  bool isLoading() {
    return false;
  }

  @override
  String title() {
    return Strings.title;
  }

  @override
  bool isUserLogged() {
    return true;
  }

  @override
  AppBar appBar() {
    return new AppBar(
      title: new Text(title()),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.tune),
          onPressed: () {
            print('Filter button');
          },
        ),
      ],
    );
  }

  @override
  Drawer drawer() {
   return new Drawer(
      child: new ListView(
        children: <Widget>[
          const DrawerHeader(
            child: const Center(
              child: const Text('Menu')
              )
          ),
          const ListTile(
            leading: const Icon(Icons.assessment),
            title: const Text('Testing'),
            selected: true,
          )
        ]
      )
    );
  }
}