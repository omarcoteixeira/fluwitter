
import 'dart:async';

abstract class DataProvider<T> {
  Future<List<T>> fetch();
}