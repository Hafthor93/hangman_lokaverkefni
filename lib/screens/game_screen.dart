import 'dart:math';
import 'dart:core';
import 'package:flutter/material.dart';
import 'package:hangman_lokaverkefni/constants.dart';
import 'package:hangman_lokaverkefni/buttons/buttons.dart';
import 'package:hangman_lokaverkefni/widgets/hangman_images.dart';
import 'package:hangman_lokaverkefni/screens/home_screen.dart';
import 'package:hangman_lokaverkefni/main.dart';
import '../widgets/hangman_widgets.dart';

class GameScreen extends StatefulWidget {
  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  @override
  void initState() {
    hangmanWords = listOfWords[random.nextInt(listOfWords.length)];

    //I have a list in a list one for the hint and one for the actual word
    hint = hangmanWords[0];
    word = hangmanWords[1];
    word = word.toUpperCase();
    checkList = word.split("");
    checkList = checkList.toSet().toList();
    super.initState();
  }

  Random random = Random();


  List checkList = [];
  int finishedWords = 0;
  String word = "";
  String hint = "";
  List<String> hangmanWords = [];

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
      //SingleChildScrollView lagar öll renderflex sem ættu að koma á símum með minni skjá
      // (held eg hehe)
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(width: 10),
                    Icon(
                      Icons.heart_broken_sharp,
                      color: kMainColorDark,
                      size: 35,
                    ),
                    SizedBox(width: 5),
                    Text(
                      "Lives Left: ${6 - Game.guesses}",
                      style: kTinyText,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SizedBox(
                          width: 180,
                        ),
                        Text("Hint", style: kTinyText,),
                        HintButton(hint: hint),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ],
                ),
                Center(
                  child: HangmanImages(),
                ),
                //Hidden wordið sem user giskar á
                HiddenWord(word: word),
                //Keyboard ready to go
                SizedBox(
                  width: double.infinity,
                  height: 250.0,
                  child: GridView.count(
                    crossAxisCount: 7,
                    mainAxisSpacing: 8.0,
                    crossAxisSpacing: 8.0,
                    padding: EdgeInsets.all(10.0),
                    children: kAlphabet.map((e) {
                      return RawMaterialButton(
                        elevation: 10,
                        onPressed: Game.selectedLetter.contains(e)
                            ? null
                            : () {
                                setState(() {
                                  print(e);
                                  Game.selectedLetter.add(e);
                                  print(Game.selectedLetter);
                                  if (checkList.contains(e)) {
                                  finishedWords += 1;
                                  if (finishedWords == checkList.length){
                                    showDialog(
                                        context: context,
                                        builder: (context) => AlertDialog(
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(Radius.circular(20))
                                          ),
                                          title: Text("Winner Winner Chicken Dinner!", style: kDialogSize,),
                                          content: Image.asset("images/winner.jpeg"),
                                          backgroundColor: kMainColorDark,
                                          actions: [
                                            //Win screen reset button
                                            ElevatedButton(
                                                onPressed: () {
                                              setState(() {
                                              Game.selectedLetter.clear();
                                              finishedWords = 0;
                                              Game.guesses = 0;
                                              Navigator.push(context, MaterialPageRoute(builder: (context) => GameScreen()));
                                            });
                                          }, style: ElevatedButton.styleFrom(textStyle: kDialogSize, primary: kMainColor),
                                                child: Text("Try Another Word", style: TextStyle(color: Colors.black),))
                                          ],
                                        ));
                                  }
                                  } else {
                                    Game.guesses++;
                                    if (Game.guesses == 6) {
                                      // Loser screen reset button
                                      showDialog(
                                          context: context,
                                          builder: (context) => AlertDialog(
                                            shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.all(Radius.circular(20))
                                            ),
                                            title: Text(" Looooser\n The word was $word", style: kDialogSize,),
                                            content: Image.asset("images/firsttime.png"),
                                            backgroundColor: kMainColorDark,
                                            actions: [
                                              //Win screen reset button
                                              ElevatedButton(onPressed: () {
                                                setState(() {
                                                  Game.selectedLetter.clear();
                                                  finishedWords = 0;
                                                  Game.guesses = 0;
                                                  Navigator.push(context, MaterialPageRoute(builder: (context) => GameScreen()));
                                                });
                                              }, style: ElevatedButton.styleFrom(textStyle: kDialogSize, primary: kMainColor),
                                                  child: Text("Try Another Word", style: kDialogSize,))
                                            ],
                                          ));
                                    }
                                  }
                                }
                                );
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
                        fillColor: Game.selectedLetter.contains(e)
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
                        setState(() {
                          Game.selectedLetter.clear();
                          finishedWords = 0;
                          Game.guesses = 0;
                        });

                        Navigator.pop(context);
                      },
                      text: Text("Back")),
                ),
                SizedBox(height: 5),
              ]
          ),
        ),
      ),
    );
  }
}


