import 'package:flutter/material.dart';

class CheckboxModel extends ChangeNotifier {
  bool isChecked;

  CheckboxModel({required this.isChecked});

  void updateIsChecked() {
    isChecked = !isChecked;
    notifyListeners();
  }
}
