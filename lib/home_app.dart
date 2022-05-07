import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hangman_lokaverkefni/constants.dart';

class HomeApp extends StatefulWidget {
  const HomeApp({Key? key}) : super(key: key);

  @override
  State<HomeApp> createState() => _HomeAppState();
}

class _HomeAppState extends State<HomeApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kMainColor,
      appBar: AppBar(
        elevation: 1,
        backgroundColor: kMainColor,
        title: Text(
          "Hangman",
          style: kGoogleFonts,
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                radius: 200.0,
                backgroundImage: AssetImage("images/gallows-with-desert-background-vector.jpg"),
              ),
            ),
            Text("Welcome to Hangman!", style: kGoogleFonts,
            ),
            Container(
              child: ElevatedButton(
                style: ButtonStyle(

                ),
                 onPressed: () {}
                 ,child: Text("PLAY", style: kGoogleFonts,),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
