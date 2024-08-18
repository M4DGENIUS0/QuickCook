import 'package:flutter/material.dart';

class Login_Screen_Provider with ChangeNotifier {
  bool _passwordVisible = false;
  bool get PasswordVisible => _passwordVisible;
  bool _obscureText = true;
  bool get Obsecure => _obscureText;

  obsecure() {
    _obscureText = !_obscureText;

    notifyListeners();
  }

  void passwordicon() {
    _passwordVisible = !_passwordVisible;
    notifyListeners();
  }
}
