import 'package:flutter/material.dart';

class NavigationBarIndexModel extends ChangeNotifier {
  late int index;

  NavigationBarIndexModel({required int initialIndex}) : index = initialIndex;

  void updateIndex({required int newIndex}) {
    index = newIndex;
    notifyListeners();
  }
}
