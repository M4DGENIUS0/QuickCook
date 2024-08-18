import 'package:flutter/material.dart';
import 'package:ingredient_cooker/features/presentation/pages/Nav_Bar_Pages/Home.dart';
import 'package:ingredient_cooker/features/presentation/pages/Nav_Bar_Pages/Search.dart';
import 'package:ingredient_cooker/features/presentation/pages/Nav_Bar_Pages/cart.dart';
import 'package:ingredient_cooker/features/presentation/pages/Nav_Bar_Pages/heart.dart';

class Nav_Pov with ChangeNotifier {
  int indexSelect = 0;

  int get _indexSelect => indexSelect;
  void indexCount(_value) {
    indexSelect = _value;
    notifyListeners();
  }
}
