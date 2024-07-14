import 'package:basics_sun_c11/model/game_board_args.dart';
import 'package:basics_sun_c11/screens/game_board/game_board.dart';
import 'package:flutter/material.dart';

class Splash extends StatelessWidget {
  static String routeName = "splash";

  Splash({super.key});

  String player1 = "";
  String player2 = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Splash"),
      ),
      body: Column(
        children: [
          TextField(
            decoration: const InputDecoration(labelText: "Player1"),
            onChanged: (text) {
              player1 = text;
            },
          ),
          TextField(
            decoration: InputDecoration(hintText: "Player2"),
            onChanged: (text) {
              player2 = text;
            },
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, "login",
                    arguments: GameBoardArgs(player1, player2));
              },
              child: Text("Start"))
        ],
      ),
    );
  }
}

// Repository
// branches
// commits
// Local/Remote branches
// Merge branches
// Pull/Push
//Force push
