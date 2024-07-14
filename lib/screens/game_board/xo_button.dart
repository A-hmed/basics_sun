import 'package:flutter/material.dart';

class XoButton extends StatelessWidget {
  final String symbol;
  final Function onPressed;
  final int index;

  const XoButton(
      {super.key,
      required this.symbol,
      required this.onPressed,
      required this.index});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
            margin: EdgeInsets.all(4),
            child: ElevatedButton(
                onPressed: () {
                  onPressed(index);
                },
                child: Text(
                  symbol,
                  style: TextStyle(fontSize: 28, color: Colors.black),
                ))));
  }
}
