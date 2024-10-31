import 'package:flutter/material.dart';

class SquareProvider with ChangeNotifier {
  int? selectedSquare;
  List<int> history = [];

  void selectSquare(int number) {
    selectedSquare = number;
    history.add(number);
    notifyListeners();
  }
}
