import 'package:flutter/material.dart';

String inputuser = "";
String result = "";

Widget getRow(String text1, String text2, String text3, String text4) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      TextButton(
        onPressed: () {
          if (text1 == 'ac') {
            setState() {
              inputuser = "";
              result = "";
            }
          } else {
            buttomnPressed(text1);
          }
        },
        child: Text(
          text1,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 26.0),
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
            setState() {
              if (inputuser.length > 0) {
                inputuser = inputuser.substring(0, inputuser.length - 1);
              }
            }
          } else {
            buttomnPressed(text2);
          }
        },
        child: Text(
          text2,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 26.0),
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
          style: TextStyle(fontSize: 26.0),
        ),
        style: TextButton.styleFrom(
          shape: CircleBorder(
              side: BorderSide(width: 0, color: Colors.transparent)),
          backgroundColor: getBackgroundColor(text3),
        ),
      ),
      TextButton(
        onPressed: () {
          buttomnPressed(text4);
        },
        child: Text(
          text4,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 26.0),
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

bool isoperator(String text) {
  var list = ['ac', 'ce', '%', '/', '*', '-', '+', '='];
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

void buttomnPressed(String text) {
  setState() {
    inputuser = inputuser += text;
  }
}
