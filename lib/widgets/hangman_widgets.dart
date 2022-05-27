import 'package:flutter/material.dart';
import 'package:hangman_lokaverkefni/constants.dart';
import 'package:hangman_lokaverkefni/widgets/hangman_widgets.dart';

import 'hangman_images.dart';

class Game {
  //adding the number of guesses
  static int guesses = 0;
  static List<String> selectedLetter = [];
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
          .split("")
          .map(
            (e) => letter(
          e.toUpperCase(),
          !Game.selectedLetter.contains(e.toUpperCase()),
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
        hangmanImage(Game.guesses >= 0, "images/hang.png"),
        hangmanImage(Game.guesses >= 1, "images/head.png"),
        hangmanImage(Game.guesses >= 2, "images/body.png"),
        hangmanImage(Game.guesses >= 3, "images/rightarm.png"),
        hangmanImage(Game.guesses >= 4, "images/leftarm.png"),
        hangmanImage(Game.guesses >= 5, "images/rightleg.png"),
        hangmanImage(Game.guesses >= 6, "images/leftleg.png"),
      ],
    );
  }
}



//AlertDialog widget to get your hint.
class AboutWidget extends StatelessWidget{

  AboutWidget({required this.hint, required this.text});

  final String hint;
  final String text;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Hint "),
      content: Text(hint,style: TextStyle(fontSize: 20),),
      titleTextStyle: TextStyle(color: Colors.black, fontSize: 25),
      backgroundColor: kMainColorDark,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20))
      ),
      actions: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            elevation: 9,
            primary: kMainColor,
          ),
            onPressed: () {
          Navigator.pop(context);
        },
            child: Text("Return to game", style: TextStyle(color: Colors.black),))
      ],
    );
  }

}