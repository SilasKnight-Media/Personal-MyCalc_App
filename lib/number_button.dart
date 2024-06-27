// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables
import 'package:flutter/material.dart';
import 'package:mycalc_app/button_event_model.dart';

class NumberButton extends StatelessWidget {
  NumberButton({
    super.key,
    required this.value,
    required this.buttonEventModel,
  });

  final String value;
  final ButtonEventModel buttonEventModel;
  final TextEditingController textFormFieldController = TextEditingController();

  void operationButtonPressed({bool append = true}) {
    if (append) {
      buttonEventModel.appendText(value);
    } else {
      buttonEventModel.setText(value);
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
            ),
            onPressed: operationButtonPressed,
            child: Text(value),
          ),
        ),
      ],
    );
  }
}

class PositionedNumberButton extends StatelessWidget {
  const PositionedNumberButton({
    super.key,
    required this.value,
    required this.buttonEventModel,
  });

  final ButtonEventModel buttonEventModel;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: NumberButton(
        value: value,
        buttonEventModel: buttonEventModel,
      ),
    );
  }
}
