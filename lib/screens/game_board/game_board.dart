import 'package:basics_sun_c11/model/game_board_args.dart';
import 'package:basics_sun_c11/screens/game_board/xo_button.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class GameBoard extends StatefulWidget {
  static const String routeName = "game_board";

  GameBoard({super.key});

  @override
  State<GameBoard> createState() => _GameBoardState();
}

class _GameBoardState extends State<GameBoard> {
  final TextStyle playerTextStyle =
      const TextStyle(fontSize: 26, fontWeight: FontWeight.w700);

  //todo: show pop dialog for the winner
  List<String> board = ["", "", "", "", "", "", "", "", ""];
  int counter = 0;
  int player1Score = 0;
  int player2Score = 0;

  @override
  Widget build(BuildContext context) {
    ModalRoute modalRoute = ModalRoute.of(context)!;
    GameBoardArgs arguments = modalRoute.settings.arguments! as GameBoardArgs;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Xo!"),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "${arguments.player1}: $player1Score",
                  style: playerTextStyle,
                ),
                Text(
                  "${arguments.player2}: $player2Score",
                  style: playerTextStyle,
                )
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                XoButton(
                  symbol: board[0],
                  onPressed: onPlayerTurn,
                  index: 0,
                ),
                XoButton(
                  symbol: board[1],
                  onPressed: onPlayerTurn,
                  index: 1,
                ),
                XoButton(
                  symbol: board[2],
                  onPressed: onPlayerTurn,
                  index: 2,
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                XoButton(
                  symbol: board[3],
                  onPressed: onPlayerTurn,
                  index: 3,
                ),
                XoButton(
                  symbol: board[4],
                  onPressed: onPlayerTurn,
                  index: 4,
                ),
                XoButton(
                  symbol: board[5],
                  onPressed: onPlayerTurn,
                  index: 5,
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                XoButton(
                  symbol: board[6],
                  onPressed: onPlayerTurn,
                  index: 6,
                ),
                XoButton(
                  symbol: board[7],
                  onPressed: onPlayerTurn,
                  index: 7,
                ),
                XoButton(
                  symbol: board[8],
                  onPressed: onPlayerTurn,
                  index: 8,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void onPlayerTurn(int index) {
    if (board[index].isNotEmpty) return;
    String symbol = counter % 2 == 0 ? "o" : "x";
    board[index] = symbol;

    if (checkWinner()) {
      if (symbol == "o") {
        player1Score++;
      } else {
        player2Score++;
      }
      clearBoard();
      Fluttertoast.showToast(
          msg: "Player ${symbol == "o" ? "1" : "2"} wins!",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.black,
          textColor: Colors.white,
          fontSize: 16.0);
      return;
    }
    if (counter == 8) {
      clearBoard();
      return;
    }
    counter++;
    setState(() {});
  }

  bool checkWinner() {
    ///Rows
    if (board[0].isNotEmpty && board[0] == board[1] && board[1] == board[2]) {
      return true;
    }
    if (board[3].isNotEmpty && board[3] == board[4] && board[4] == board[5]) {
      return true;
    }
    if (board[6].isNotEmpty && board[6] == board[7] && board[7] == board[8]) {
      return true;
    }

    ///Columns
    if (board[0].isNotEmpty && board[0] == board[3] && board[3] == board[6]) {
      return true;
    }
    if (board[1].isNotEmpty && board[1] == board[4] && board[4] == board[7]) {
      return true;
    }
    if (board[2].isNotEmpty && board[2] == board[5] && board[5] == board[8]) {
      return true;
    }

    ///Diagonals
    if (board[0].isNotEmpty && board[0] == board[4] && board[4] == board[8]) {
      return true;
    }
    if (board[2].isNotEmpty && board[2] == board[4] && board[4] == board[6]) {
      return true;
    }

    return false;
  }

  void clearBoard() {
    board = ["", "", "", "", "", "", "", "", ""];
    counter = 0;
    setState(() {});
  }
}
