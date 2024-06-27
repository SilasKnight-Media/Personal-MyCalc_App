import 'package:flutter/material.dart';

class ButtonEventModel extends ChangeNotifier {
  String _currentText = '';

  String get currentText => _currentText;

  void setText(String textToSet) {
    _currentText = textToSet;
    notifyListeners();
  }

  void appendText(String textToAppend) {
    _currentText += textToAppend;
    notifyListeners();
  }

  void backspaceText() {
    if (_currentText.isNotEmpty) {
      _currentText = _currentText.substring(0, _currentText.length - 1);
      notifyListeners();
    }
  }
}
