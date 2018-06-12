import 'package:fluwitter/pages/home/home_contract.dart';
import 'package:fluwitter/pages/home/home_view.dart';

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
    // TODO: implement load
  }

}