import 'package:fluwitter/pages/notifications/notifications_contract.dart';
import 'package:fluwitter/pages/notifications/notifications_view.dart';

class NotificationsPresenter extends NotificationsPresenterContract {

  NotificationsView view;
  NotificationsPresenter presenter;

  NotificationsPresenter(this.view);

  @override
  void initView() {
    this.load();
  }

  @override
  void load() {
    // TODO: implement load
  }

}