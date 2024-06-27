import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:mycalc_app/title_section.dart';
import 'package:mycalc_app/button_event_model.dart';
import 'package:mycalc_app/button_rows.dart';
import 'package:mycalc_app/operation_button.dart';
import 'package:mycalc_app/number_button.dart';

class CalcAppHomePage extends StatefulWidget {
  const CalcAppHomePage({super.key});

  @override
  State<CalcAppHomePage> createState() => _CalcAppHomePageState();
}

class _CalcAppHomePageState extends State<CalcAppHomePage> {
  // Declarations
  static final ButtonEventModel _buttonEventModel = ButtonEventModel();
  static final TextEditingController _controller = TextEditingController();

  /// Returns the platform-specific width as a fraction of the screen width.
  ///
  /// This function adjusts the width based on the platform:
  /// - On the web, it returns 65% of the screen width.
  /// - On all other platforms, it returns 80% of the screen width.
  ///
  /// Parameters:
  /// - `context`: The `BuildContext` from which the screen size is obtained.
  ///
  /// Returns:
  /// A `double` representing the platform-specific width.
  double platformSpecificWidth(BuildContext context) {
    if (kIsWeb) {
      return MediaQuery.of(context).size.width * 0.65;
    } else {
      return MediaQuery.of(context).size.width * 0.8;
    }
  }

  /// Builds the main widget for the MyCalc application.
  ///
  /// This function constructs the main UI of the calculator app, including:
  /// - An app bar with the title 'MyCalc'.
  /// - A body with a centered row containing a column of buttons and a title section.
  /// - The column includes various operation and number buttons arranged in rows.
  ///
  /// Parameters:
  /// - `context`: The `BuildContext` in which the widget is built.
  ///
  /// Returns:
  /// A `Widget` representing the main structure of the calculator application.
  @override
  Widget build(BuildContext context) {
    const String appTitle = 'MyCalc';

    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(appTitle),
        ),
        body: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height,
              width: platformSpecificWidth(context),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ListenableBuilder(
                    listenable: _buttonEventModel,
                    builder: (context, child) {
                      return ListView(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        children: [
                          // Equation Box
                          TitleSection(
                            name: 'Enter equation:',
                            equationText: _buttonEventModel.currentText,
                            textEditingController: _controller,
                          ),
                          // Row 1
                          OperationButtonRowSection(
                            operationList: const ['+', '-', '*', '/'],
                            buttonEventModel: _buttonEventModel,
                          ),
                          // Row 2
                          NumberButtonRowSection(
                            operationList: const ['1', '2', '3', '4'],
                            buttonEventModel: _buttonEventModel,
                          ),
                          // Row 3
                          NumberButtonRowSection(
                            operationList: const ['5', '6', '7', '8'],
                            buttonEventModel: _buttonEventModel,
                          ),
                          // Row 4
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              PositionedNumberButton(
                                value: '9',
                                buttonEventModel: _buttonEventModel,
                              ),
                              PositionedOperationButton(
                                value: 'C',
                                operationButtonType: OperationButtonType.clearEquation,
                                buttonEventModel: _buttonEventModel,
                              ),
                              PositionedOperationButton(
                                value: '\u219E',
                                operationButtonType: OperationButtonType.backspaceText,
                                buttonEventModel: _buttonEventModel,
                              ),
                              PositionedOperationButton(
                                value: '=',
                                operationButtonType: OperationButtonType.equationEquals,
                                buttonEventModel: _buttonEventModel,
                              ),
                            ],
                          ),
                        ],
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyCalcApp extends StatelessWidget {
  const MyCalcApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: CalcAppHomePage(),
    );
  }
}
