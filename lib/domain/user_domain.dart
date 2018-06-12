
import 'dart:async';

import 'package:fluwitter/providers/data_provider.dart';

class User {
  final String name;
  final String email;
  final bool isActive;

  const User({this.name, this.email, this.isActive});
}

abstract class UserDataProvider extends DataProvider<User> {
  Future<User> auth(String token);
  Future<List<User>> fetch();
}