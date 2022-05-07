import 'package:flutter/material.dart';


class HomeScreenButtons extends StatelessWidget {
  HomeScreenButtons({required this.onPress, required this.text})

  final void Function() onPress;
  final Widget text;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPress,
      child: ,

    );
  }
}


