import 'package:fluwitter/infrastructure/dependency_injection.dart';
import 'package:fluwitter/infrastructure/flavor.dart';
import 'package:flutter/material.dart';

import 'package:fluwitter/pages/home/home_page.dart';
import 'package:fluwitter/pages/login/login_page.dart';
import 'package:fluwitter/pages/messages/messages_page.dart';
import 'package:fluwitter/pages/notifications/notifications_page.dart';
import 'package:fluwitter/pages/profile/profile_page.dart';
import 'package:fluwitter/pages/questions/questions_page.dart';
import 'package:fluwitter/pages/search/search_page.dart';
import 'package:fluwitter/pages/settings/settings_page.dart';

void main() { 
  Injector.configure(Flavor.PRODUCTION);
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Fluwitter',
      home: HomePage(),
      initialRoute: '/login',
      routes: <String, WidgetBuilder> {
        '/login': (BuildContext context) => new LoginPage(),
        '/home' : (BuildContext context) => new HomePage(),
        '/profile' : (BuildContext context) => new ProfilePage(),
        '/messages' : (BuildContext context) => new MessagesPage(),
        '/search' : (BuildContext context) => new SearchPage(),
        '/notifications' : (BuildContext context) => new NotificationsPage(),
        '/questions' : (BuildContext context) => new QuestionsPage(),
        '/settings' : (BuildContext context) => new SettingsPage()
      },
    );
  }
}