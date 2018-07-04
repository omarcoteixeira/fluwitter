import 'package:fluwitter/pages/questions/questions_contract.dart';
import 'package:fluwitter/pages/questions/questions_view.dart';

class QuestionsPresenter extends QuestionsPresenterContract {

  QuestionsView view;
  QuestionsPresenter presenter;

  QuestionsPresenter(this.view);

  @override
  void initView() {
    this.load();
  }

  @override
  void load() {
    // TODO: implement load
  }

}