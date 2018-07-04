import 'package:fluwitter/pages/messages/messages_contract.dart';
import 'package:fluwitter/pages/messages/messages_view.dart';

class MessagesPresenter extends MessagesPresenterContract {

  MessagesView view;
  MessagesPresenter presenter;

  MessagesPresenter(this.view);

  @override
  void initView() {
    this.load();
  }

  @override
  void load() {
    // TODO: implement load
  }

}