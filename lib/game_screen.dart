import 'dart:math';
import 'dart:core';
import 'package:flutter/material.dart';
import 'package:hangman_lokaverkefni/constants.dart';
import 'package:hangman_lokaverkefni/buttons.dart';
import 'package:hangman_lokaverkefni/hangman_images.dart';
import 'package:hangman_lokaverkefni/home_screen.dart';
import 'package:hangman_lokaverkefni/main.dart';
import 'package:english_words/english_words.dart';

import 'game_keyboard.dart';

class Game {
  //adding the number of tries
  static int tries = 0;
  static List<String> selectedChar = [];
}

class GameScreen extends StatefulWidget {
  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {



  @override
  void initState() {
    obj = marvelCharacters[random.nextInt(marvelCharacters.length)];
    //desc = obj[0];
    word = obj[0];
    word = word.toUpperCase();
    checkList = word.split("");
    checkList = checkList.toSet().toList();
    super.initState();


  }

  Random random = Random();

  String spaceInWord = "-";
  List checkList = [];
  int finishedWords = 0;
  String word = "";
  //String desc = "";
  List<String> obj = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kMainColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: kMainColor,
        elevation: 0,
        title: Text(
          "Hangman",
          style: kGoogleFonts,
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Stack(
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
            ),
          ),
            //TODO: lata hidden word hér
            Wrap(
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
            ),
          //TODO: Lata keyboard her
          SizedBox(
            width: double.infinity,
            height: 250.0,
            child: GridView.count(
              crossAxisCount: 7,
              mainAxisSpacing: 8.0,
              crossAxisSpacing: 8.0,
              padding: EdgeInsets.all(8.0),
              children: kAlphabet.map((e) {
                return RawMaterialButton(
                  elevation: 10,
                  onPressed: Game.selectedChar.contains(e)
                      ? null // we first check that we didn't selected the button before
                      : () {
                          setState(() {
                            Game.selectedChar.add(e);
                            print(Game.selectedChar);
                            if (!marvelCharacters.contains(e.toUpperCase())) {
                              Game.tries++;
                            }
                          });
                        },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(7.0),
                  ),
                  child: Text(
                    e,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  fillColor: Game.selectedChar.contains(e)
                      ? kMainColorDark
                      : kMainColor,
                );
              }).toList(),
            ),
    ),
        ],
      ),
    );
  }
}
