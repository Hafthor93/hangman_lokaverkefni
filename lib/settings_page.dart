import 'package:flutter/material.dart';
import 'constants.dart';
import 'buttons.dart';
import 'home_screen.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kMainColor,
        automaticallyImplyLeading: false,
        title: Text("Settings"
        ,style: kGoogleFonts,
        ),
      ),
      backgroundColor: kMainColor,
      body: Center(
        child: Container(
          padding: EdgeInsets.only(left: 40.0, right: 40.0),
          child: ScreenBackButtons(color: kMainColor, text: Text("Back"),
          onPress: () {
            Navigator.pop(context);
          }),
        ),
      ),
    );
  }
}
