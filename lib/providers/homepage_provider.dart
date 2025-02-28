import 'package:flutter/cupertino.dart';

class HomePageProvider with ChangeNotifier {
  List<int> _displayXO = [5, 5, 5, 5, 5, 5, 5, 5, 5];
  List<int> _displayWinner = [];
  bool _xTurn = true;
  bool _isGameOver = false;
  String _winnerName = '';

  List<int> get displayXO => _displayXO;
  List<int> get displayWinner => _displayWinner;
  bool get xTurn => _xTurn;
  bool get isGameOver => _isGameOver;
  String get winnerName => _winnerName;

  // On Player Tap in any Cell this method is called
  void playerTap(int cellIndex) {
    if (xTurn && displayXO[cellIndex] == 5) {
      _xTurn = !xTurn;
      displayXO[cellIndex] = 1;
      _checkWinner(1);
      notifyListeners();
    } else if (displayXO[cellIndex] == 5) {
      displayXO[cellIndex] = 2;
      _xTurn = !xTurn;
      _checkWinner(2);
      notifyListeners();
    }
  }

  // This method is called when a player is tapped on reset button
  void resetButton() {
    _displayWinner = [];
    _displayXO = [5, 5, 5, 5, 5, 5, 5, 5, 5];
    _xTurn = true;
    _isGameOver = false;
    _winnerName = '';
    notifyListeners();
  }

  // This method check winner every time when a player is tapped on a cell
  void _checkWinner(int playerTurn) {
    if (playerTurn == 1) {
      bool condition1 = displayXO[0] + displayXO[1] + displayXO[2] == 3;
      bool condition2 = displayXO[3] + displayXO[4] + displayXO[5] == 3;
      bool condition3 = displayXO[6] + displayXO[7] + displayXO[8] == 3;
      bool condition4 = displayXO[0] + displayXO[3] + displayXO[6] == 3;
      bool condition5 = displayXO[1] + displayXO[4] + displayXO[7] == 3;
      bool condition6 = displayXO[2] + displayXO[5] + displayXO[8] == 3;
      bool condition7 = displayXO[0] + displayXO[4] + displayXO[8] == 3;
      bool condition8 = displayXO[2] + displayXO[4] + displayXO[6] == 3;

      if (condition1 ||
          condition2 ||
          condition3 ||
          condition4 ||
          condition5 ||
          condition6 ||
          condition7 ||
          condition8) {
        print('x is won');
        _isGameOver = true;
        _winnerName = 'X';
        if (condition1) {
          _displayWinner.addAll([0, 1, 2]);
        }
        if (condition2) {
          _displayWinner.addAll([3, 4, 5]);
        }
        if (condition3) {
          _displayWinner.addAll([6, 7, 8]);
        }
        if (condition4) {
          _displayWinner.addAll([0, 3, 6]);
        }
        if (condition5) {
          _displayWinner.addAll([1, 4, 7]);
        }
        if (condition6) {
          _displayWinner.addAll([2, 5, 8]);
        }
        if (condition7) {
          _displayWinner.addAll([0, 4, 8]);
        }
        if (condition8) {
          _displayWinner.addAll([2, 4, 6]);
        }
      } else if (!displayXO.contains(5)) {
        print('Match is tie');
        _winnerName = 'Match is Tie! Try Again';
      }
    } else {
      bool condition1 = displayXO[0] + displayXO[1] + displayXO[2] == 6;
      bool condition2 = displayXO[3] + displayXO[4] + displayXO[5] == 6;
      bool condition3 = displayXO[6] + displayXO[7] + displayXO[8] == 6;
      bool condition4 = displayXO[0] + displayXO[3] + displayXO[6] == 6;
      bool condition5 = displayXO[1] + displayXO[4] + displayXO[7] == 6;
      bool condition6 = displayXO[2] + displayXO[5] + displayXO[8] == 6;
      bool condition7 = displayXO[0] + displayXO[4] + displayXO[8] == 6;
      bool condition8 = displayXO[2] + displayXO[4] + displayXO[6] == 6;

      if (condition1 ||
          condition2 ||
          condition3 ||
          condition4 ||
          condition5 ||
          condition6 ||
          condition7 ||
          condition8) {
        print('o is won');
        _isGameOver = true;
        _winnerName = 'O';
        if (condition1) {
          _displayWinner.addAll([0, 1, 2]);
        }
        if (condition2) {
          _displayWinner.addAll([3, 4, 5]);
        }
        if (condition3) {
          _displayWinner.addAll([6, 7, 8]);
        }
        if (condition4) {
          _displayWinner.addAll([0, 3, 6]);
        }
        if (condition5) {
          _displayWinner.addAll([1, 4, 7]);
        }
        if (condition6) {
          _displayWinner.addAll([2, 5, 8]);
        }
        if (condition7) {
          _displayWinner.addAll([0, 4, 8]);
        }
        if (condition8) {
          _displayWinner.addAll([2, 4, 6]);
        }
      }
    }
  }
}
