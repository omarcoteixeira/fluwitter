
import 'package:fluwitter/pages/home/home_strings.dart' as Strings;
import 'package:fluwitter/common/loading_state.dart';
import 'package:fluwitter/pages/home/home_presenter.dart';
import 'package:fluwitter/pages/home/home_view.dart';
import 'package:flutter/material.dart';
import 'package:fluwitter/pages/settings/settings_page.dart';

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

  void _navigateSettigsPage(){
    Navigator.pop(context);

    Navigator.push(
      context,
      new MaterialPageRoute(builder: (context) => new SettingsPage())
    );
  }

  @override
  Drawer drawer() {
   return new Drawer(
      child: new ListView(
        children: <Widget>[
          DrawerHeader(
            child: new Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                new CircleAvatar(
                  radius: 30.0, 
                  child: new Text(Strings.menuUserDefaultPhotoText)
                ), new Container(
                  child: new Column(
                    children: <Widget>[
                      new Text(
                        Strings.menuUserDefaultNameText, 
                        style: new TextStyle(fontWeight: FontWeight.w800)
                      ),
                      const Text(Strings.menuUserDefaultEmailText)
                    ],
                  ),
                )
              ],
            )
          ),
          const ListTile(
            leading: const Icon(Icons.home),
            title: const Text(Strings.menuHome),
            selected: true,
          ),
          const ListTile(
            leading: const Icon(Icons.account_circle),
            title: const Text(Strings.menuProfile),
            selected: false,
          ),
          const ListTile(
            leading: const Icon(Icons.search),
            title: const Text(Strings.menuSearch),
            selected: false,
          ),
          const ListTile(
            leading: const Icon(Icons.notifications),
            title: const Text(Strings.menuNotifications),
            selected: false,
          ),
          const ListTile(
            leading: const Icon(Icons.mail),
            title: const Text(Strings.menuDirectMessages),
            selected: false,
          ),
          const ListTile(
            leading: const Icon(Icons.question_answer),
            title: const Text(Strings.menuQuestionsAndAnswers),
            selected: false,
          ),
          new Divider(),
          new ListTile(
            leading: const Icon(Icons.settings),
            title: const Text(Strings.menuSettingsAndPrivacy),
            selected: false,
            onTap: () {
              _navigateSettigsPage();
            },
          ),
          new Divider(),
          const ListTile(
            leading: const Icon(Icons.exit_to_app),
            title: const Text(Strings.menuLogout),
            selected: false,
          ),
        ]
      )
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