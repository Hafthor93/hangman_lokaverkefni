import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hangman_lokaverkefni/constants.dart';
import 'package:hangman_lokaverkefni/game_screen.dart';
import 'package:hangman_lokaverkefni/buttons.dart';
import 'settings_page.dart';

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
        elevation: 0,
        backgroundColor: kMainColor,
        title: Text(
          "Hangman",
          style: kGoogleFonts,
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 15,),
              Center(
                child: CircleAvatar(
                  radius: 200.0,
                  backgroundImage: AssetImage(
                      "images/gallows-with-desert-background-vector.jpg"),
                ),
              ),
              Text(
                "Welcome to Hangman!",
                style: kGoogleFonts,
              ),
              SizedBox(
                height: 20.0,
              ),
              Container(
                child: ReusableCard(
                    color: kMainColorDark,
                    text: Text("START GAME"),
                    onPress: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => GameScreen(),
                        ),
                      );
                    }),
              ),
              SizedBox(height: 20,),
              //TODO: Settings page kannski
              Container(
                child: ReusableCard(
                  color: kMainColorDark,
                  text: Text("SETTINGS"),
                  onPress: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => SettingsPage(),
                    ),
                    );
                  },
                ),
              ),
              SizedBox(height: 70),
            ],
          ),
        ),
      ),
    );
  }
}
