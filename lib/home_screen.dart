import 'package:calculator_app/button_widget.dart';
import 'package:calculator_app/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:math_expressions/math_expressions.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double firstNo = 0.0;

  double secondNo = 0.0;

  var input = '';

  var output = '';

  var operator = '';

  onButtonClick(value) {
    if (value == 'AC') {
      input = '';
      output = '';
    } else if (value == '<') {
      input = input.substring(0, input.length - 1);
    } else if (value == '=') {
      var userInput = input;
      userInput = input.replaceAll('x', '*');
      Parser p = Parser();
      Expression expression = p.parse(userInput);
      ContextModel cm = ContextModel();
      var finalValue = expression.evaluate(EvaluationType.REAL, cm);
      output = finalValue.toString();
    } else {
      input += value;
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          children: [
            Expanded(
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      input,
                      style: GoogleFonts.montserrat(
                          fontSize: 40, color: Colors.white),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      output,
                      style: GoogleFonts.montserrat(
                          fontSize: 40, color: Colors.white),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                  ],
                ),
              ),
            ),
            Row(
              children: [
                ButtonWidget(
                  text: 'AC',
                  press: () => onButtonClick('AC'),
                  tColor: orangeColor,
                  buttonBgColor: operatorBgColor,
                ),
                ButtonWidget(
                  text: '<',
                  press: () => onButtonClick('<'),
                  tColor: operatorColor,
                  buttonBgColor: operatorBgColor,
                ),
                ButtonWidget(
                  text: '%',
                  press: () => onButtonClick('%'),
                  tColor: operatorColor,
                  buttonBgColor: operatorBgColor,
                ),
                ButtonWidget(
                  text: '/',
                  press: () => onButtonClick('/'),
                  tColor: operatorColor,
                  buttonBgColor: operatorBgColor,
                ),
              ],
            ),
            Row(
              children: [
                ButtonWidget(
                  text: '7',
                  press: () => onButtonClick('7'),
                ),
                ButtonWidget(
                  text: '8',
                  press: () => onButtonClick('8'),
                ),
                ButtonWidget(
                  text: '9',
                  press: () => onButtonClick('9'),
                ),
                ButtonWidget(
                  text: 'x',
                  press: () => onButtonClick('x'),
                  tColor: operatorColor,
                  buttonBgColor: operatorBgColor,
                ),
              ],
            ),
            Row(
              children: [
                ButtonWidget(
                  text: '4',
                  press: () => onButtonClick('4'),
                ),
                ButtonWidget(
                  text: '5',
                  press: () => onButtonClick('5'),
                ),
                ButtonWidget(
                  text: '6',
                  press: () => onButtonClick('6'),
                ),
                ButtonWidget(
                  text: '-',
                  press: () => onButtonClick('-'),
                  tColor: operatorColor,
                  buttonBgColor: operatorBgColor,
                ),
              ],
            ),
            Row(
              children: [
                ButtonWidget(
                  text: '1',
                  press: () => onButtonClick('1'),
                ),
                ButtonWidget(
                  text: '2',
                  press: () => onButtonClick('2'),
                ),
                ButtonWidget(
                  text: '3',
                  press: () => onButtonClick('3'),
                ),
                ButtonWidget(
                  text: '+',
                  press: () => onButtonClick('+'),
                  tColor: operatorColor,
                  buttonBgColor: operatorBgColor,
                ),
              ],
            ),
            Row(
              children: [
                ButtonWidget(
                  text: '',
                  press: () => onButtonClick('AC'),
                  buttonBgColor: Colors.transparent,
                ),
                ButtonWidget(
                  text: '0',
                  press: () => onButtonClick('0'),
                ),
                ButtonWidget(
                  text: '.',
                  press: () => onButtonClick('.'),
                ),
                ButtonWidget(
                  text: '=',
                  press: () => onButtonClick('='),
                  tColor: operatorColor,
                  buttonBgColor: operatorBgColor,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
