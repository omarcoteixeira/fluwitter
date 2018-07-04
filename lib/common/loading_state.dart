import 'package:flutter/material.dart';
import 'package:fluwitter/strings.dart' as Strings;

import 'package:fluwitter/pages/home/home_page.dart';
import 'package:fluwitter/pages/search/search_page.dart';
import 'package:fluwitter/pages/settings/settings_page.dart';
import 'package:fluwitter/pages/notifications/notifications_page.dart';
import 'package:fluwitter/pages/messages/messages_page.dart';
import 'package:fluwitter/pages/profile/profile_page.dart';
import 'package:fluwitter/pages/questions/questions_page.dart';

abstract class LoadingBaseState<T extends StatefulWidget> extends State<T> {

  @override
  Widget build(BuildContext context) => new Scaffold(
    appBar: appBar(),
    drawer: defaultDrawer(context),
    body: isLoading() ? new Center(child: new CircularProgressIndicator()): content(),
    floatingActionButton: floatingActionButton()
  );

  Widget content();
  AppBar appBar();
  FloatingActionButton floatingActionButton();

  String title();

  bool isLoading();
  bool isUserLogged();

  Drawer defaultDrawer(BuildContext context) {
    String _route = 'home';

    void _navigate(StatefulWidget widget, String route){
      Navigator.pop(context);

      setState(() => _route = route);
      
      Navigator.push(
        context,
        new MaterialPageRoute(builder: (context) => widget)
      );
    }

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
            new ListTile(
              leading: const Icon(Icons.home),
              title: const Text(Strings.menuHome),
              // selected: _route == 'home',
              onTap: () {
              return _navigate(new HomePage(), 'home');
              },
            ),
            new ListTile(
              leading: const Icon(Icons.account_circle),
              title: const Text(Strings.menuProfile),
              selected: false,
              // selected: _route == 'profile',
              onTap: () {
                return _navigate(new ProfilePage(), 'profile');
              },
            ),
            new ListTile(
              leading: const Icon(Icons.search),
              title: const Text(Strings.menuSearch),
              // selected: _route == 'search',
              onTap: () {
              return _navigate(new SearchPage(), 'search');
              },
            ),
            new ListTile(
              leading: const Icon(Icons.notifications),
              title: const Text(Strings.menuNotifications),
              selected: false,
              // selected: _route == 'notifications',
              onTap: () {
                return _navigate(new NotificationsPage(), 'notifications');
              },
            ),
            new ListTile(
              leading: const Icon(Icons.mail),
              title: const Text(Strings.menuDirectMessages),
              selected: false,
              // selected: _route == 'messages',
              onTap: () {
                return _navigate(new MessagesPage(), 'messages');
              },
            ),
            new ListTile(
              leading: const Icon(Icons.question_answer),
              title: const Text(Strings.menuQuestionsAndAnswers),
              selected: false,
              // selected: _route == 'settings',
              onTap: () {
                return _navigate(new QuestionsPage(), 'questions');
              },
            ),
            new Divider(),
            new ListTile(
              leading: const Icon(Icons.settings),
              title: const Text(Strings.menuSettingsAndPrivacy),
              // selected: _route == 'settings',
              onTap: () {
              return _navigate(new SettingsPage(), 'settings');
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
}