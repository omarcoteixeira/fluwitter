import 'package:fluwitter/pages/settings/settings_contract.dart';
import 'package:fluwitter/pages/settings/settings_view.dart';

class SettingsPresenter extends SettingsPresenterContract {

  SettingsView view;
  SettingsPresenter presenter;

  SettingsPresenter(this.view);

  @override
  void initView() {
    this.load();
  }

  @override
  void load() {
    // TODO: implement load
  }

}