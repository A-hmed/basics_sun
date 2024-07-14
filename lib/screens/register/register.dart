import 'package:flutter/material.dart';

class Register extends StatelessWidget {
  static const String routeName = "register";

  const Register({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Register"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(
              context,
            );
          },
          child: Text("Sign in"),
        ),
      ),
    );
  }
}
