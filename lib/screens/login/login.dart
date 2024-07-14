import 'package:basics_sun_c11/screens/home/home.dart';
import 'package:basics_sun_c11/screens/register/register.dart';
import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  static const String routeName = "login";

  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, Home.routeName);
                },
                child: Text("Home")),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, Register.routeName);
                },
                child: Text("Register"))
          ],
        ),
      ),
    );
  }
}
