import 'package:basics_sun_c11/screens/calculator/calculator.dart';
import 'package:basics_sun_c11/screens/game_board/game_board.dart';
import 'package:basics_sun_c11/screens/game_board/splash.dart';
import 'package:basics_sun_c11/screens/home/home.dart';
import 'package:basics_sun_c11/screens/login/login.dart';
import 'package:basics_sun_c11/screens/register/register.dart';
import 'package:flutter/material.dart';

const Color purple = Color(0xff781fa9);
const TextStyle defaultStyle = TextStyle(fontSize: 20, color: Colors.white);

void main() {
  runApp(MyApp());
}

/// Test comment for commit
class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        Home.routeName: (_) {
          return Home();
        },
        Login.routeName: (_) => Login(),
        Register.routeName: (_) => Register(),
        Calculator.routeName: (_) => Calculator(),
        GameBoard.routeName: (_) => GameBoard(),
        Splash.routeName: (_) => Splash(),
      },
    );
  }
}

/// Containers widgets
/// Row, Column, Stack
