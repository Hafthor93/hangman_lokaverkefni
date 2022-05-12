import 'package:flutter/material.dart';
import 'package:hangman_lokaverkefni/constants.dart';


Widget letter(String character, bool hidden) {
  return Container(
    height: 50,
    width: 50,
    padding: EdgeInsets.all(10.0),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(7.0),
    ),
    child: Visibility(
      visible: !hidden,
      child: Center(
        child: Text(
          character,
          style: TextStyle(
            color: kMainColorDark,
            fontWeight: FontWeight.bold,
            fontSize: 29.0,
          ),
        ),
      ),
    ),
  );
}