import 'package:fluwitter/infrastructure/dependency_injection.dart';
import 'package:fluwitter/infrastructure/flavor.dart';
import 'package:flutter/material.dart';

import 'package:fluwitter/pages/home/home_page.dart';
import 'package:fluwitter/pages/login/login_page.dart';
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
        '/search' : (BuildContext context) => new SearchPage(),
        '/settings' : (BuildContext context) => new SettingsPage()
      },
    );
  }
}