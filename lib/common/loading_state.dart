import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluwitter/strings.dart' as Strings;
import 'package:fluwitter/utils.dart';

abstract class LoadingBaseState<T extends StatefulWidget> extends State<T> {
  @override
  Widget build(BuildContext context) => new Scaffold(
      appBar: appBar(),
      drawer: defaultDrawer(context),
      body: isLoading()
          ? new Center(child: new CircularProgressIndicator())
          : content(),
      floatingActionButton: floatingActionButton());

  Widget content();
  AppBar appBar();
  FloatingActionButton floatingActionButton();

  String _currentRoute = 'home';
  String title();

  bool isLoading();
  bool isUserLogged();

  signOut() async {
    showConfirmationDialog(context, 'Logout', 'Are you sure?', <Widget>[
      new FlatButton(
          child: new Text("Cancel"),
          onPressed: () {
            Navigator.of(context).pop();
          }),
      new FlatButton(
          child: new Text("Yes"),
          onPressed: () async {
            FirebaseAuth.instance.signOut();
            _navigate('/login');
          })
    ]);
  }

  _navigate(String route) {
    setState(() => this._currentRoute = route);

    Navigator.of(context).pop();
    Navigator.of(context).pushNamed(route);
  }

  Drawer defaultDrawer(BuildContext context) {
    return new Drawer(
        child: new ListView(children: <Widget>[
      DrawerHeader(
          child: new Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          new CircleAvatar(
              radius: 30.0, child: new Text(Strings.menuUserDefaultPhotoText)),
          new Container(
            child: new Column(
              children: <Widget>[
                new Text(Strings.menuUserDefaultNameText,
                    style: new TextStyle(fontWeight: FontWeight.w800)),
                const Text(Strings.menuUserDefaultEmailText)
              ],
            ),
          )
        ],
      )),
      new ListTile(
        leading: const Icon(Icons.home),
        title: const Text(Strings.menuHome),
        // selected: _route == 'home',
        onTap: () {
          return _navigate('/home');
        },
      ),
      new ListTile(
        leading: const Icon(Icons.account_circle),
        title: const Text(Strings.menuProfile),
        selected: false,
        // selected: _route == 'profile',
        onTap: () {
          return _navigate('/profile');
        },
      ),
      new ListTile(
        leading: const Icon(Icons.search),
        title: const Text(Strings.menuSearch),
        // selected: _route == 'search',
        onTap: () {
          return _navigate('/search');
        },
      ),
      new ListTile(
        leading: const Icon(Icons.notifications),
        title: const Text(Strings.menuNotifications),
        selected: false,
        // selected: _route == 'notifications',
        onTap: () {
          return _navigate('/notifications');
        },
      ),
      new ListTile(
        leading: const Icon(Icons.mail),
        title: const Text(Strings.menuDirectMessages),
        selected: false,
        // selected: _route == 'messages',
        onTap: () {
          return _navigate('/messages');
        },
      ),
      new ListTile(
        leading: const Icon(Icons.question_answer),
        title: const Text(Strings.menuQuestionsAndAnswers),
        selected: false,
        // selected: _route == 'settings',
        onTap: () {
          return _navigate('/questions');
        },
      ),
      new Divider(),
      new ListTile(
        leading: const Icon(Icons.settings),
        title: const Text(Strings.menuSettingsAndPrivacy),
        // selected: _route == 'settings',
        onTap: () {
          return _navigate('/settings');
        },
      ),
      new Divider(),
      ListTile(
          leading: const Icon(Icons.exit_to_app),
          title: const Text(Strings.menuLogout),
          selected: false,
          onTap: () {
            this.signOut();
          }),
    ]));
  }
}
