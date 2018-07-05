import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';

import 'package:fluwitter/pages/home/home_strings.dart' as Strings;
import 'package:fluwitter/common/loading_state.dart';
import 'package:fluwitter/pages/home/home_presenter.dart';
import 'package:fluwitter/pages/home/home_view.dart';

class HomePage extends StatefulWidget {
  final FirebaseApp app;

  HomePage({this.app});

  @override
  State createState() => new HomePageState();

}

class HomePageState extends LoadingBaseState<HomePage> {

  HomeView view;
  HomePresenter presenter;
  FirebaseDatabase database;

  @override
  void initState() async{
    super.initState();
    this.view = new HomeView(context);
    this.presenter = new HomePresenter(view);
    this.presenter.initView();

    FirebaseUser user = await FirebaseAuth.instance.currentUser();
    print(user);
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
            // FirebaseDatabase.instance.reference().once().then((DataSnapshot snapshot) {
            //   print('Connected to the database and read ${snapshot.value}');
            // });
          },
        ),
      ],
    );
  }

  @override
  FloatingActionButton floatingActionButton() {
    return new FloatingActionButton(
      child: new Icon(Icons.add),
      onPressed: (){}
    );
  }
}