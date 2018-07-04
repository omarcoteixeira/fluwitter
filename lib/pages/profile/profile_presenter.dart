import 'package:fluwitter/pages/profile/profile_contract.dart';
import 'package:fluwitter/pages/profile/profile_view.dart';

class ProfilePresenter extends ProfilePresenterContract {

  ProfileView view;
  ProfilePresenter presenter;

  ProfilePresenter(this.view);

  @override
  void initView() {
    this.load();
  }

  @override
  void load() {
    // TODO: implement load
  }

}