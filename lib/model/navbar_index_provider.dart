import 'package:flutter/material.dart';

class NavigationBarIndexProvider extends ChangeNotifier {
  late int index;

  NavigationBarIndexProvider({required int initialIndex})
      : index = initialIndex;

  void updateIndex({required int newIndex}) {
    index = newIndex;
    notifyListeners();
  }
}
