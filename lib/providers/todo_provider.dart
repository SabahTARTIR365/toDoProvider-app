import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

class ToDoClass extends ChangeNotifier {
  late bool isDark = false;
  changeIsDarkMode() {
    isDark = !isDark;
    notifyListeners();
  }

 late  bool isAccepted = false;
  changeIsAccepted() {
    isAccepted = !isAccepted;
    notifyListeners();
  }

  String name = "SABAH";
  int age = 10;
  bool isMale = true;
  changeName(String newName) {
    name = newName;
    notifyListeners();
  }
}