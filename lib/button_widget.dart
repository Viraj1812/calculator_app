import 'package:calculator_app/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({
    required this.text,
    required this.press,
    this.tColor = Colors.white,
    this.buttonBgColor = buttonColor,
    super.key,
  });

  final String text;
  final Color tColor;
  final Color buttonBgColor;
  final Function press;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(8),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.all(22),
              backgroundColor: buttonBgColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              )),
          onPressed: () => press(),
          child: Text(
            text,
            style: GoogleFonts.montserrat(
              color: tColor,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ),
      ),
    );
  }
}
