import 'package:fluwitter/pages/search/search_contract.dart';
import 'package:fluwitter/pages/search/search_view.dart';

class SearchPresenter extends SearchPresenterContract {

  SearchView view;
  SearchPresenter presenter;

  SearchPresenter(this.view);

  @override
  void initView() {
    this.load();
  }

  @override
  void load() {
    // TODO: implement load
  }

}