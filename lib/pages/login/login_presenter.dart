
import 'package:fluwitter/domain/user_domain.dart';
import 'package:fluwitter/infrastructure/dependency_injection.dart';
import 'package:fluwitter/pages/login/login_contract.dart';
import 'package:fluwitter/pages/login/login_view.dart';
import 'package:fluwitter/pages/login/login_strings.dart' as Strings;

class LoginPresenter extends LoginPresenterContract {

  LoginView view;
  UserDataProvider _userDataProvider;

  LoginPresenter(this.view) {
    _userDataProvider = new Injector().userDataProvider;
  }

  @override
  initView() {
    this.view.onConfirmCallback = auth;
    this.view.onCancelCallback = cancel;
    this.view.onFacebookLoginClickListener = facebookAuth;
    this.view.onGooglePlusLoginClickListener = googlePlusAuth;
  }

  @override
  void auth() async {
    if (isFormValid()) {
      // var user = await _userDataProvider.auth('xxxxxx');
      this.view.onAuthenticationComplete();
    }
  }

  bool isFormValid(){
    String p = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    var email = this.view.emailController.text.trim();
    var pass = this.view.passController.text;

    RegExp exp = new RegExp(p);
    if(!exp.hasMatch(email)){
      this.view.showInfoPopup(Strings.emailError);
      return false;
    }

    if(pass.length<6){
      this.view.showInfoPopup(Strings.passError);
      return false;
    }
    
    return true;
  }

  @override
  void cancel() {
    // TODO: implement cancel
  }

  @override
  void confirm() {
    // TODO: implement confirm
  }

  @override
  void facebookAuth() {
    print('Facebook Login Listener');
  }

  @override
  void googlePlusAuth() {
    print('Google Plus Login Listener');
  }
}