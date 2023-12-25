import 'package:calculator_app/button_widget.dart';
import 'package:flutter/material.dart';

class ButtonRow extends StatelessWidget {
  const ButtonRow(
      {super.key,
      required this.ls,
      required this.tColor,
      required this.onPress,
      required this.buttonBgColor});

  final List<String> ls;
  final List tColor;
  final Function(String) onPress;
  final List buttonBgColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (int i = 0; i < ls.length; i += 4)
          Row(
            children: [
              for (int j = i; j < i + 4; j++)
                ButtonWidget(
                  text: ls[j],
                  press: () {
                    Future.microtask(() => onPress(ls[j]));
                  },
                  tColor: tColor[j],
                  buttonBgColor: buttonBgColor[j],
                )
            ],
          ),
      ],
    );
  }
}
