import 'package:fluwitter/domain/user_domain.dart';
import 'package:fluwitter/infrastructure/flavor.dart';

class Injector {
  static final Injector _singleton = new Injector._internal();
  static Flavor _flavor;

  static void configure(Flavor flavor) {
    _flavor = flavor;
  }

  factory Injector() {
    return _singleton;
  }

  Injector._internal();

  UserDataProvider get userDataProvider {
    switch(_flavor) {
      case Flavor.MOCK: return null;
      case Flavor.DEVELOPMENT: return null;
      case Flavor.QA: return null;
      default: // Flavor.PRODUCTION:
       return null;
    }
  }
}