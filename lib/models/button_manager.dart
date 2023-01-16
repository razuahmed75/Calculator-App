import 'package:flutter/foundation.dart';
import 'package:math_expressions/math_expressions.dart';

class ButtonController extends ChangeNotifier {
  String userQuestion = '';
  String userAnswer = '';
  double textSize = 0;

  // add user input to field
  void addUserInput(int index) {
    userQuestion += buttons[index];
    textSize = 20;
    notifyListeners();
  }

  // clear user input
  void clear() {
    userQuestion = '';
    userAnswer = '';
    notifyListeners();
  }

  // delte user input
  void delete() {
    if (userQuestion.length > 0) {
      userQuestion = userQuestion.substring(0, userQuestion.length - 1);
    }

    notifyListeners();
  }

  // equal operator
  void equalPressed() {
    if (userQuestion.length > 0) {
      String finalQuestion = userQuestion;
      finalQuestion = userQuestion.replaceAll('x', '*');

      Parser p = Parser();
      Expression exp = p.parse(finalQuestion);

      ContextModel cm = ContextModel();
      double eval = exp.evaluate(EvaluationType.REAL, cm);

      userAnswer = eval.toString();
      if (userAnswer.endsWith('.0')) {
        userAnswer = userAnswer.substring(0, userAnswer.length - 2);
      }
      textSize = 40;
      // userQuestion = userAnswer;
    }

    notifyListeners();
  }

  // void operatorPressed() {
  //   String finalQuestion = userQuestion;
  //   finalQuestion = userQuestion.replaceAll('x', '*');

  //   Parser p = Parser();
  //   Expression exp = p.parse(finalQuestion);

  //   ContextModel cm = ContextModel();
  //   double eval = exp.evaluate(EvaluationType.REAL, cm);

  //   userAnswer = eval.toString();
  //   notifyListeners();
  // }

  bool isOperator(String x) {
    if (x == '%' || x == '/' || x == 'x' || x == '-' || x == '+' || x == '=') {
      return true;
    }
    return false;
  }

  List<String> buttons = [
    "AC",
    "DEL",
    "%",
    "/",
    "9",
    "8",
    "7",
    "x",
    "6",
    "5",
    "4",
    "-",
    "3",
    "2",
    "1",
    "+",
    "0",
    ".",
    "ANS",
    "=",
  ];
}
