import 'dart:async';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_twitter_login/flutter_twitter_login.dart';
import 'package:fluwitter/keys.dart' as Keys;

enum AuthProviderType {
  TWITTER,
}

class AuthProvider {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  static Future<FirebaseApp> firebaseConfigure() {
    return  FirebaseApp.configure(
      name: Keys.appName,
      options: new FirebaseOptions(
        apiKey: Keys.firebaseApiKey,
        databaseURL: Keys.firebaseDatabaURL,
        projectID: Keys.firebaseProjectId,
        storageBucket: Keys.firebaseStorageBucket,
        gcmSenderID: Keys.firebaseGCMSenderID,
        googleAppID: Platform.isIOS ? 
          Keys.firebaseGoogleAppIDIOS : 
          Keys.firebaseGoogleAppIDAndroid
      )
    );
  }

  Future<FirebaseUser> auth(AuthProviderType authType) {
    switch (authType) {
      case AuthProviderType.TWITTER:
        return _twitterAuth();
        break;
      default:
        return null;
    }
  }

  Future<FirebaseUser> _twitterAuth() async {
    var twitterLogin = new TwitterLogin(
      consumerKey: Keys.twitterConsumerKey,
      consumerSecret: Keys.twitterConsumerSecret,
    ), result = await twitterLogin.authorize();

    switch (result.status) {
      case TwitterLoginStatus.loggedIn:
        return _handleTwitterFirebaseSignin(result);
        break;
      case TwitterLoginStatus.cancelledByUser:
        break;
      case TwitterLoginStatus.error:
        print("Error on trying to authenticate the twitter user");
        break;
    }

    return null;
  }

  Future<FirebaseUser> _handleTwitterFirebaseSignin(TwitterLoginResult result) async {
    var _currentUserTwitterSession = result.session;
    
    FirebaseUser authenticatedUser = await _firebaseAuth.signInWithTwitter(
        authToken: _currentUserTwitterSession?.token ?? '',
        authTokenSecret: _currentUserTwitterSession?.secret ?? ''
    );

    assert(authenticatedUser.email != null);
    assert(authenticatedUser.displayName != null);

    return authenticatedUser;
  }
}