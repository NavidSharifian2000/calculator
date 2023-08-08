import 'package:calculator/constans/constans.dart';
import 'package:calculator/widgets/numberAndOperators.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(Application());
}

class Application extends StatefulWidget {
  const Application({super.key});

  @override
  State<Application> createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
  String inputUser = "";
  Parser p = Parser();

  void buttomnPressed(String text) {
    setState(() {
      if (text == "x") {
        inputUser = inputUser + "*";
      } else {
        inputUser = inputUser + text;
      }
    });
  }

  Widget getRow(String text1, String text2, String text3, String text4) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextButton(
          onPressed: () {
            if (text1 == 'ac') {
              setState(() {
                inputUser = "";
                result = "";
              });
            } else {
              buttomnPressed(text1);
            }
            ;
          },
          child: Text(
            text1,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 26.0, color: getColorText(text1)),
          ),
          style: TextButton.styleFrom(
            shape: CircleBorder(
                side: BorderSide(width: 0, color: Colors.transparent)),
            backgroundColor: getBackgroundColor(text1),
          ),
        ),
        TextButton(
          onPressed: () {
            if (text2 == 'ce') {
              setState(() {
                if (inputUser != "") {
                  inputUser = inputUser.substring(0, inputUser.length - 1);
                }
              });
            } else {
              buttomnPressed(text2);
            }
          },
          child: Text(
            text2,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 26.0, color: getColorText(text2)),
          ),
          style: TextButton.styleFrom(
            shape: CircleBorder(
                side: BorderSide(width: 0, color: Colors.transparent)),
            backgroundColor: getBackgroundColor(text2),
          ),
        ),
        TextButton(
          onPressed: () {
            buttomnPressed(text3);
          },
          child: Text(
            text3,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 26.0, color: getColorText(text3)),
          ),
          style: TextButton.styleFrom(
            shape: CircleBorder(
                side: BorderSide(width: 0, color: Colors.transparent)),
            backgroundColor: getBackgroundColor(text3),
          ),
        ),
        TextButton(
          onPressed: () {
            if (text4 == '=') {
              if (inputUser != "") {
                Parser p = new Parser();
                Expression exp = p.parse(inputUser);
                ContextModel cm = ContextModel();
                double eval = exp.evaluate(EvaluationType.REAL, cm);
                setState(() {
                  result = eval.toString();
                });
              }
            } else {
              buttomnPressed(text4);
            }
          },
          child: Text(
            text4,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 26.0, color: getColorText(text4)),
          ),
          style: TextButton.styleFrom(
            shape: CircleBorder(
                side: BorderSide(width: 0, color: Colors.transparent)),
            backgroundColor: getBackgroundColor(text4),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 3,
              child: Container(
                  color: aboveSection,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        inputUser,
                        textAlign: TextAlign.end,
                        style: TextStyle(color: Colors.amber, fontSize: 50),
                      ),
                      Text(
                        result,
                        textAlign: TextAlign.end,
                      ),
                    ],
                  )),
            ),
            Expanded(
                flex: 7,
                child: Container(
                  color: buttonSection,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      getRow("ac", "ce", "%", "/"),
                      getRow("7", "8", "9", "x"),
                      getRow("4", "5", "6", "-"),
                      getRow("1", "2", "3", "+"),
                      getRow("00", "0", ".", "="),
                    ],
                  ),
                ))
          ],
        )),
      ),
    );
  }
}

bool isoperator(String text) {
  var list = ['ac', 'ce', '%', '/', 'x', '-', '+', '='];
  if (list.contains(text)) {
    return true;
  } else {
    return false;
  }
}

Color getBackgroundColor(String text) {
  if (isoperator(text)) {
    return Colors.amber;
  } else {
    return Colors.white;
  }
}

Color getColorText(String text) {
  if (isoperator(text)) {
    return Colors.green;
  } else {
    return Colors.blue;
  }
}

String getresult() {
  return result;
}

String getinput() {
  return inputuser;
}
