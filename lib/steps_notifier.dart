import 'package:flutter/foundation.dart';

class StepsNotifier extends ValueNotifier<int> {
  StepsNotifier() : super(0);

  void increment(int amount) {
    value += amount;
  }
}