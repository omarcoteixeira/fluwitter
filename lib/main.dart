import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';

import 'package:fluwitter/infrastructure/dependency_injection.dart';
import 'package:fluwitter/infrastructure/flavor.dart';
import 'package:fluwitter/providers/auth_provider.dart';

import 'package:fluwitter/pages/home/home_page.dart';
import 'package:fluwitter/pages/login/login_page.dart';
import 'package:fluwitter/pages/messages/messages_page.dart';
import 'package:fluwitter/pages/notifications/notifications_page.dart';
import 'package:fluwitter/pages/profile/profile_page.dart';
import 'package:fluwitter/pages/questions/questions_page.dart';
import 'package:fluwitter/pages/search/search_page.dart';
import 'package:fluwitter/pages/settings/settings_page.dart';

void main() async {
  final FirebaseApp app = await AuthProvider.firebaseConfigure();

  Injector.configure(Flavor.PRODUCTION);
  runApp(new MyApp(app: app));
}

class MyApp extends StatelessWidget {
  final FirebaseApp app;

  MyApp({this.app});

  @override
  Widget build(BuildContext context) {
    // This part is necessary to start the application database
    new FirebaseDatabase(app: this.app);

    return new MaterialApp(
      title: 'Fluwitter',
      home: _getHomePage(),
      routes: <String, WidgetBuilder>{
        '/login': (BuildContext context) => new LoginPage(),
        '/home': (BuildContext context) => new HomePage(app: app),
        '/profile': (BuildContext context) => new ProfilePage(),
        '/messages': (BuildContext context) => new MessagesPage(),
        '/search': (BuildContext context) => new SearchPage(),
        '/notifications': (BuildContext context) => new NotificationsPage(),
        '/questions': (BuildContext context) => new QuestionsPage(),
        '/settings': (BuildContext context) => new SettingsPage()
      },
    );
  }

  Widget _getHomePage() {
    return StreamBuilder<FirebaseUser>(
      stream: FirebaseAuth.instance.onAuthStateChanged,
      builder: (BuildContext context, snapshot) {
        return (snapshot.hasData) ? HomePage() : LoginPage();
      },
    );
  }
}
