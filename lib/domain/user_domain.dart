
import 'dart:async';

import 'package:fluwitter/providers/data_provider.dart';

class User {
  String name;
  String email;
  String twitterToken;
  String twitterTokenSecret;
  bool isActive;

  User({this.name, this.email});

  User.map(dynamic obj) {
    this.name = obj["name"];
    this.email = obj["password"];
    this.isActive = obj["isActive"];
    this.twitterToken = obj["twitterToken"];
    this.twitterTokenSecret = obj["twitterTokenSecret"];
  }

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map["name"] = this.name;
    map["email"] = this.email;
    map["isActive"] = this.isActive;
    map["twitterToken"] = this.twitterToken;
    map["twitterTokenSecret"] = this.twitterTokenSecret;
    
    return map;
  }
}

abstract class UserDataProvider extends DataProvider<User> {
  Future<User> auth(String token);
  Future<List<User>> fetch();
}