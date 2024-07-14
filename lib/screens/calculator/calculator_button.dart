import 'package:flutter/material.dart';

class CalculatorButton extends StatelessWidget {
  final String digit;
  final Function onClick;

  const CalculatorButton(
      {super.key, required this.digit, required this.onClick});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
            margin: EdgeInsets.all(4),
            child: ElevatedButton(
                onPressed: () {
                  if (digit == "=") {
                    onClick();
                  } else {
                    onClick(digit);
                  }
                },
                child: Text(
                  digit,
                  style: TextStyle(fontSize: 24),
                ))));
  }
}
