import 'dart:math';
import 'dart:core';
import 'package:flutter/material.dart';
import 'package:hangman_lokaverkefni/constants.dart';
import 'package:hangman_lokaverkefni/buttons.dart';
import 'package:hangman_lokaverkefni/hangman_images.dart';
import 'package:hangman_lokaverkefni/home_screen.dart';
import 'package:hangman_lokaverkefni/main.dart';
import 'hangman_widgets.dart';

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
            child: HangmanImages(),
          ),
          //TODO: lata hidden word hér
          HiddenWord(word: word),
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
                      ? null
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
          Container(
            child: ScreenBackButtons(
                color: kMainColorDark,
                onPress: () {
                  Navigator.pop(context);
                },
                text: Text("Back")),
          ),
          SizedBox(height: 28,)
        ],
      ),
    );
  }
}
