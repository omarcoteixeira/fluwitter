import 'package:fluwitter/pages/home/home_contract.dart';
import 'package:fluwitter/pages/home/home_view.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomePresenter extends HomePresenterContract {

  HomeView view;
  HomePresenter presenter;

  HomePresenter(this.view);

  @override
  void initView() {
    this.load();
  }

  @override
  void load() {
    FirebaseAuth.instance.currentUser()
      .then((FirebaseUser user) {
        if (user != null)
          print(user.providerData.toList());
      });
  }

}