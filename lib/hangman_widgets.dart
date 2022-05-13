import 'package:flutter/material.dart';
import 'package:hangman_lokaverkefni/constants.dart';

import 'hangman_images.dart';

class Game {
  //adding the number of tries
  static int tries = 0;
  static List<String> selectedChar = [];
}

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

class HiddenWord extends StatelessWidget {
  const HiddenWord({
    Key? key,
    required this.word,
  }) : super(key: key);

  final String word;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 2,
      runSpacing: 2,
      alignment: WrapAlignment.center,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: word
          .split('')
          .map(
            (e) => letter(
          e.toUpperCase(),
          !Game.selectedChar.contains(e.toUpperCase()),
        ),
      )
          .toList(),
    );
  }
}

class HangmanImages extends StatelessWidget {
  const HangmanImages({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        //Adding images of the Hangman animation
        //So if you fail another image will pop up on the screen
        //Visibility makes that happen see hangman_images.dart
        SizedBox(),
        hangmanImage(Game.tries >= 0, "images/hang.png"),
        hangmanImage(Game.tries >= 1, "images/head.png"),
        hangmanImage(Game.tries >= 2, "images/body.png"),
        hangmanImage(Game.tries >= 3, "images/rightarm.png"),
        hangmanImage(Game.tries >= 4, "images/leftarm.png"),
        hangmanImage(Game.tries >= 5, "images/rightleg.png"),
        hangmanImage(Game.tries >= 6, "images/leftleg.png"),
      ],
    );
  }
}