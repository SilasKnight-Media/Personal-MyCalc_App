// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables
import 'package:flutter/material.dart';
import 'package:mycalc_app/button_event_model.dart';
import 'package:math_expressions/math_expressions.dart';

enum OperationButtonType {
  appendText,
  setText,
  backspaceText,
  equationEquals,
  clearEquation,
}

class OperationButton extends StatelessWidget {
  const OperationButton({
    super.key,
    required this.value,
    required this.operationButtonType,
    required this.buttonEventModel,
  });

  final ButtonEventModel buttonEventModel;
  final String value;
  final OperationButtonType operationButtonType;

  void operationButtonPressed() {
    switch (operationButtonType) {
      case OperationButtonType.appendText:
        buttonEventModel.appendText(value);
        break;
      case OperationButtonType.setText:
        buttonEventModel.setText(value);
        break;
      case OperationButtonType.clearEquation:
        buttonEventModel.setText('');
        break;
      case OperationButtonType.backspaceText:
        buttonEventModel.backspaceText();
        break;
      case OperationButtonType.equationEquals:
        final Parser mathParser = Parser();
        final Expression mathExpression = mathParser.parse(buttonEventModel.currentText);
        final String result = mathExpression.evaluate(EvaluationType.REAL, ContextModel()).toString();
        buttonEventModel.setText(result);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              maximumSize: Size.fromWidth(MediaQuery.of(context).size.width / 2),
              padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 20.0),
              textStyle: const TextStyle(fontSize: 20),
              backgroundColor: const Color.fromARGB(255, 233, 230, 230),
              foregroundColor: Colors.blue,
            ),
            onPressed: operationButtonPressed,
            child: Text(value),
          ),
        ),
      ],
    );
  }
}

class PositionedOperationButton extends StatelessWidget {
  const PositionedOperationButton({
    super.key,
    required this.value,
    this.operationButtonType = OperationButtonType.appendText,
    required this.buttonEventModel,
  });

  final ButtonEventModel buttonEventModel;
  final String value;
  final OperationButtonType operationButtonType;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: OperationButton(
        value: value,
        operationButtonType: operationButtonType,
        buttonEventModel: buttonEventModel,
      ),
    );
  }
}
