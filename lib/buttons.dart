import 'package:flutter/material.dart';
import 'constants.dart';

class ReusableCard extends StatelessWidget {
  ReusableCard(
      {required this.color, required this.onPress, required this.text});

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
        textStyle: kGoogleFonts,
      ),
    );
  }
}
