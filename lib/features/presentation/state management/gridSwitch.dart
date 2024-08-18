import 'package:flutter/material.dart';

class GridSwitch with ChangeNotifier {

  bool isGridView = true;
  // Multi select effect
  List<String> _selectedIndex = [];
  List<String> get selectindex => _selectedIndex;


  void onCardTap(String index,) {
    if (_selectedIndex.contains(index) ) {
      _selectedIndex.remove(index);
    } else {
      _selectedIndex.add(index);
    }
    notifyListeners();
}

  bool isSelected(String index) {
    return _selectedIndex.contains(index);
  }

  
  int isContain() {
    return _selectedIndex.length;
  }




// new code

  int? _selectIndex;
  Map<int, int> _selectedQuantities = {};

  int? get selectIndex => _selectIndex;
  Map<int, int> get selectedQuantities => _selectedQuantities;

  void setSelectedIndex(int index) {

    _selectIndex = index;
    notifyListeners();
  }


  void setQuantity(int index, int quantity) {
    _selectedQuantities[index] = quantity;
    notifyListeners();
  }

  void toggle() {
    isGridView = !isGridView;
    notifyListeners();
  }
  }
