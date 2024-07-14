import 'package:basics_sun_c11/screens/calculator/calculator_button.dart';
import 'package:flutter/material.dart';

class Calculator extends StatefulWidget {
  static const String routeName = "calculator";

  Calculator({super.key});

  @override
  State createState() {
    return CalculatorState();
  }
}

class CalculatorState extends State {
  String result = '';
  String lhs = '';
  String savedOperator = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculator"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    result,
                    textAlign: TextAlign.end,
                    style: TextStyle(color: Colors.black, fontSize: 32),
                  ),
                ],
              )),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CalculatorButton(
                  digit: "7",
                  onClick: onDigitClick,
                ),
                CalculatorButton(
                  digit: "8",
                  onClick: onDigitClick,
                ),
                CalculatorButton(
                  digit: "9",
                  onClick: onDigitClick,
                ),
                CalculatorButton(
                  digit: "x",
                  onClick: onOperatorClick,
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CalculatorButton(
                  digit: "4",
                  onClick: onDigitClick,
                ),
                CalculatorButton(
                  digit: "5",
                  onClick: onDigitClick,
                ),
                CalculatorButton(
                  digit: "6",
                  onClick: onDigitClick,
                ),
                CalculatorButton(
                  digit: "/",
                  onClick: onOperatorClick,
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CalculatorButton(
                  digit: "1",
                  onClick: onDigitClick,
                ),
                CalculatorButton(
                  digit: "2",
                  onClick: onDigitClick,
                ),
                CalculatorButton(
                  digit: "3",
                  onClick: onDigitClick,
                ),
                CalculatorButton(
                  digit: "+",
                  onClick: onOperatorClick,
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CalculatorButton(
                  digit: ".",
                  onClick: onDigitClick,
                ),
                CalculatorButton(
                  digit: "0",
                  onClick: onDigitClick,
                ),
                CalculatorButton(
                  digit: "=",
                  onClick: onEqualClick,
                ),
                CalculatorButton(
                  digit: "-",
                  onClick: onOperatorClick,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void onDigitClick(String digit) {
    if (result.contains(".") && digit == ".") {
      return;
    }
    result += digit;
    setState(() {});
  }

  void onOperatorClick(String clickedOperator) {
    if (savedOperator.isEmpty) {
      lhs = result;
    } else {
      lhs = calculate(lhs, savedOperator, result);
    }
    savedOperator = clickedOperator;
    result = "";
    setState(() {});
    print("LHS = $lhs, savedOperator = $savedOperator");
  }

  void onEqualClick() {
    result = calculate(lhs, savedOperator, result);
    lhs = "";
    savedOperator = "";
    setState(() {});
  }

  String calculate(String lhs, String operator, String rhs) {
    int n1 = int.parse(lhs);
    int n2 = int.parse(rhs);

    switch (operator) {
      case "+":
        return (n1 + n2).toString();
      case "-":
        return (n1 - n2).toString();
      case "x":
        return (n1 * n2).toString();
      default:
        return (n1 / n2).toString();
    }
  }
}
