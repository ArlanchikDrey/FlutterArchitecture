import 'package:flutter/material.dart';

class BottomNavNotifier extends ChangeNotifier {
  int _selected = 0;

  int get selectedPage => _selected;

  final List<GlobalKey<NavigatorState>> keys = [
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
  ];

  void setSelectedItem(int value) {
    print(keys[_selected].currentState);
    if (_selected == value) {
      keys[_selected].currentState.popUntil((route) => route.isFirst);
    }
    _selected = value;

    notifyListeners();
  }
}
