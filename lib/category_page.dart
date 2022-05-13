import 'package:flutter/material.dart';
import 'package:hangman_lokaverkefni/buttons.dart';
import 'package:hangman_lokaverkefni/constants.dart';
import 'package:hangman_lokaverkefni/game_screen.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({Key? key}) : super(key: key);

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text("Categories", style: kGoogleFonts),
        backgroundColor: kMainColor,
        automaticallyImplyLeading: true,
      ),
      backgroundColor: kMainColor,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => GameScreen()));
              },
              child: SafeArea(
                child: Container(
                  alignment: Alignment.topLeft,
                  margin: EdgeInsets.only(top: 30.0, left: 6.0, right: 6.0),
                  height: 100,
                  width: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: kMainColorDark,
                  ),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 55,
                        backgroundImage: AssetImage(
                          "images/marvellogo.jpeg",
                        ),
                      ),
                      Text(
                        "Marvel Characters",
                        style: kCategoryStyle,
                      )
                    ],
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 40.0, right: 40.0),
              child: ScreenBackButtons(
                  color: kMainColorDark,
                  onPress: () {
                    Navigator.pop(context);
                  },
                  text: Text("Back To Main Menu")),
            ),
          ],
        ),
      ),
    );
  }
}
