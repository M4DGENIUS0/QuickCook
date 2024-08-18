import 'package:flutter/material.dart';

class Theme_Mode with ChangeNotifier {
  bool click = true;
  bool get _click => click;
  var Thememode = ThemeMode.light;
  ThemeMode get themeData => Thememode;

  void setTheme(themeData) {
    Thememode = themeData;
    notifyListeners();
  }

  void ChangeIcon() {
    click = true;
    notifyListeners();
  }
}
