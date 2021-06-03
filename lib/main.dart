import 'package:flutter/material.dart';
import 'package:quiz_app/ui/home.dart';

final ThemeData _appTheme = _buildAppTheme();

ThemeData _buildAppTheme() {
  final ThemeData base = ThemeData.dark();
  return base.copyWith(
    brightness: Brightness.dark,
    accentColor: Colors.amber.shade700,
    primaryColor: Colors.blue.shade700,
    backgroundColor: Colors.amber.shade900,
    scaffoldBackgroundColor: Colors.grey.shade700,
    textTheme: _appTextTheme(base.textTheme)
  );
}
TextTheme _appTextTheme(TextTheme base){
  return base.copyWith(
    headline1: base.headline1!.copyWith(
      fontWeight: FontWeight.bold
    ),
    headline6: base.headline6!.copyWith(
      fontSize: 18.0,
      fontStyle: FontStyle.italic
    ),
    caption: base.caption!.copyWith(
      fontWeight: FontWeight.bold,
      fontSize: 14.0
    ),
    bodyText1: TextStyle(
      fontSize: 16.9,
      fontFamily: 'Lobster',
      color: Colors.white
    ),
    bodyText2: TextStyle(
      fontSize: 16.9,
      fontFamily: 'Lobster',
      color: Colors.white
    ),
    button: base.button!.copyWith(
      letterSpacing: 3,
      fontSize: 20.0
    )
  ).apply(
    fontFamily: 'Lobster',
    displayColor: Colors.amber,
  );
}



void main() {
  runApp(
      MaterialApp(
        theme: _appTheme,
        // theme: ThemeData(
        //   brightness: Brightness.dark,
        //   primaryColor: Colors.grey.shade700,
        //   textTheme: TextTheme(
        //     headline1: TextStyle(
        //       fontSize: 34,
        //       fontWeight: FontWeight.bold
        //     ),
        //     bodyText2: TextStyle(
        //       fontSize: 16.9,
        //       color: Colors.white
        //     ),
        //   )
        // ),
        home: QuizApp(),
      )
  );
}
