import 'package:flutter/material.dart';
import 'package:mycalc_app/operation_button.dart';
import 'package:mycalc_app/number_button.dart';
import 'package:mycalc_app/button_event_model.dart';

class OperationButtonRowSection extends StatelessWidget {
  const OperationButtonRowSection({
    super.key,
    required this.operationList,
    this.operationButtonTypes = const [
      OperationButtonType.appendText,
      OperationButtonType.appendText,
      OperationButtonType.appendText,
      OperationButtonType.appendText,
    ],
    required this.buttonEventModel,
  });

  final ButtonEventModel buttonEventModel;
  final List<String> operationList;
  final List<OperationButtonType> operationButtonTypes;

  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          PositionedOperationButton(
            value: operationList[0],
            operationButtonType: operationButtonTypes[0],
            buttonEventModel: buttonEventModel,
          ),
          PositionedOperationButton(
            value: operationList[1],
            operationButtonType: operationButtonTypes[1],
            buttonEventModel: buttonEventModel,
          ),
          PositionedOperationButton(
            value: operationList[2],
            operationButtonType: operationButtonTypes[2],
            buttonEventModel: buttonEventModel,
          ),
          PositionedOperationButton(
            value: operationList[3],
            operationButtonType: operationButtonTypes[3],
            buttonEventModel: buttonEventModel,
          ),
        ],
      ),
    );
  }
}

class NumberButtonRowSection extends StatelessWidget {
  const NumberButtonRowSection({
    super.key,
    required this.operationList,
    required this.buttonEventModel,
  });

  final ButtonEventModel buttonEventModel;
  final List<String> operationList;

  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          PositionedNumberButton(
            value: operationList[0],
            buttonEventModel: buttonEventModel,
          ),
          PositionedNumberButton(
            value: operationList[1],
            buttonEventModel: buttonEventModel,
          ),
          PositionedNumberButton(
            value: operationList[2],
            buttonEventModel: buttonEventModel,
          ),
          PositionedNumberButton(
            value: operationList[3],
            buttonEventModel: buttonEventModel,
          ),
        ],
      ),
    );
  }
}
