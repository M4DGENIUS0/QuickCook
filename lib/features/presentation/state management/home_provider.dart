import 'package:flutter/material.dart';

class HomeProvider with ChangeNotifier {
  bool recipe_load = false;
  bool get _recipeLoad => recipe_load;
  int valchange = 0;
  int get _valchange => valchange;
  void subtract() {
    if (valchange > 1) {
      valchange -= 1;
    } 
    notifyListeners();
  }
  void yes(){
    recipe_load = true;
    notifyListeners();
  }
  void no(bool no){
    recipe_load = no;
    notifyListeners();
  }
  void add(){
    valchange += 1;
    notifyListeners();
  }

}
