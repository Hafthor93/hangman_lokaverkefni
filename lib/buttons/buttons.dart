import 'dart:ui';

import 'package:flutter/material.dart';
import '../constants.dart';
import '../widgets/hangman_widgets.dart';

class ReusableCard extends StatelessWidget {
  ReusableCard({required this.color, required this.onPress, required this.text});

  final Color color;
  final Function() onPress;
  final Text text;


  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPress,
      child: text,
      style: ElevatedButton.styleFrom(
        primary: color,
        elevation: 15,
        padding: EdgeInsets.only(right: 30.0, left: 30.0),
        textStyle: kGoogleFonts,
      ),
    );
  }
}



class ScreenBackButtons extends StatelessWidget {
  ScreenBackButtons({required this.color, required this.onPress, required this.text});

  final Color color;
  final Function() onPress;
  final Text text;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPress,
      child: text,
      style: ElevatedButton.styleFrom(
        primary: kMainColorDark,
        elevation: 15,
        padding: EdgeInsets.only(right: 30.0, left: 30.0),
        textStyle: kTinyText,
      ),
    );
  }
}


class HintButton extends StatelessWidget {
  const HintButton({
    Key? key,
    required this.hint,
  }) : super(key: key);

  final String hint;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      color: kMainColorDark,
      iconSize: 35,
      icon: Icon(Icons.lightbulb),
      onPressed: () => showDialog(
        context: context,
        builder: (context) => AboutWidget(
          text: 'Hint',
          hint: '$hint',
        ),
      ),
    );
  }
}