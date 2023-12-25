import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Display extends StatelessWidget {
  const Display({
    required this.input,
    required this.output,
    required this.outputSize,
    Key? key,
  }) : super(key: key);

  final String input;
  final String output;
  final double outputSize;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              input,
              style: GoogleFonts.montserrat(fontSize: 40, color: Colors.white),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              output,
              style: GoogleFonts.montserrat(
                  fontSize: outputSize, color: Colors.white),
            ),
            const SizedBox(
              height: 40,
            ),
          ],
        ),
      ),
    );
  }
}
