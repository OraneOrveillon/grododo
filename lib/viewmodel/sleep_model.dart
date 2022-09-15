import 'package:flutter/material.dart';

class SleepModel extends ChangeNotifier {
  bool isSleeping = false;

  SleepModel();

  void updateIsSleeping() {
    isSleeping = !isSleeping;
    notifyListeners();
  }
}
