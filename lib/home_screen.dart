import 'package:calculator_app/button_row.dart';
import 'package:calculator_app/diaplay.dart';
import 'package:calculator_app/helper.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double firstNo = 0.0;
  double secondNo = 0.0;
  String input = '';
  String output = '';
  String operator = '';
  bool hideInput = false;
  double outputSize = 34.0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          children: [
            Display(
                input: hideInput ? '' : input,
                output: output,
                outputSize: outputSize),
            ButtonRow(
                ls: buttonValues,
                tColor: tColor,
                onPress: onButtonClick,
                buttonBgColor: buttonBgColor)
          ],
        ),
      ),
    );
  }

  void onButtonClick(String value) {
    if (value == 'AC') {
      input = '';
      output = '';
    } else if (value == '<') {
      if (input.isNotEmpty) {
        input = input.substring(0, input.length - 1);
      }
    } else if (value == '=') {
      if (input.isNotEmpty) {
        var userInput = input;
        userInput = input.replaceAll('x', '*');
        Parser p = Parser();
        Expression expression = p.parse(userInput);
        ContextModel cm = ContextModel();
        var finalValue = expression.evaluate(EvaluationType.REAL, cm);
        output = finalValue.toString();
        if (output.endsWith(".0")) {
          output = output.substring(0, output.length - 2);
        }
        input = output;
        hideInput = true;
        outputSize = 52;
      }
    } else {
      hideInput = false;
      outputSize = 34;
      if (isOperator(value) &&
          input.isNotEmpty &&
          isOperator(input[input.length - 1])) {
        input = input.substring(0, input.length - 1) + value;
      } else {
        input += value;
      }
    }

    setState(() {});
  }

  bool isOperator(String value) {
    List<String> operators = ['+', '-', 'x', '/'];
    return operators.contains(value);
  }
}
