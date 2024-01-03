import 'package:calculator_app/button_row.dart';
import 'package:calculator_app/diaplay.dart';
import 'package:calculator_app/helper.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:math_expressions/math_expressions.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ValueNotifier<String> inputNotifier = ValueNotifier<String>('');
  ValueNotifier<String> outputNotifier = ValueNotifier<String>('');
  ValueNotifier<bool> hideInputNotifier = ValueNotifier<bool>(false);
  ValueNotifier<double> outputSizeNotifier = ValueNotifier<double>(34.0);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          children: [
            ValueListenableBuilder<String>(
              valueListenable: inputNotifier,
              builder: (context, input, _) {
                return Display(
                    input: hideInputNotifier.value ? '' : input,
                    output: outputNotifier.value,
                    outputSize: outputSizeNotifier.value);
              },
            ),
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
      inputNotifier.value = '';
      outputNotifier.value = '';
    } else if (value == '<') {
      if (inputNotifier.value.isNotEmpty) {
        inputNotifier.value =
            inputNotifier.value.substring(0, inputNotifier.value.length - 1);
      }
    } else if (value == '=') {
      if (inputNotifier.value.isNotEmpty) {
        var userInput = inputNotifier.value;
        userInput = inputNotifier.value.replaceAll('x', '*');
        Parser p = Parser();
        Expression expression = p.parse(userInput);
        ContextModel cm = ContextModel();
        var finalValue = expression.evaluate(EvaluationType.REAL, cm);
        outputNotifier.value = finalValue.toString();
        if (outputNotifier.value.endsWith(".0")) {
          outputNotifier.value = outputNotifier.value
              .substring(0, outputNotifier.value.length - 2);
        }
        inputNotifier.value = outputNotifier.value;
        hideInputNotifier.value = true;
        outputSizeNotifier.value = 52;
      }
    } else if (inputNotifier.value.isEmpty && isOperator(value)) {
      Fluttertoast.showToast(
          msg: "Invalid Format Used",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    } else {
      hideInputNotifier.value = false;
      outputSizeNotifier.value = 34;
      if (isOperator(value) &&
          inputNotifier.value.isNotEmpty &&
          isOperator(inputNotifier.value[inputNotifier.value.length - 1])) {
        inputNotifier.value =
            inputNotifier.value.substring(0, inputNotifier.value.length - 1) +
                value;
      } else {
        inputNotifier.value += value;
      }
    }
  }

  bool isOperator(String value) {
    List<String> operators = ['+', '-', 'x', '/'];
    return operators.contains(value);
  }
}
