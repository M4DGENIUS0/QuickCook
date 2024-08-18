import 'package:flutter/material.dart';

class Setting_Prov with ChangeNotifier {
  // password toggle
  bool _password = false;
  bool get Passwd => _password;
  bool _obsecuretext = false;
  bool get ObsecureText => _obsecuretext;

  void toggle() {
    _password = !_password;
    _obsecuretext = !_obsecuretext;
    notifyListeners();
  }
}
