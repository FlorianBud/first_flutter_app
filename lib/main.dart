import 'package:first_flutter_app/parsing_json/json_parsing.dart';
import 'package:first_flutter_app/ui/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//
//void main() => runApp(ScaffoldExample());

final ThemeData _appTheme = _buildAppTheme();

ThemeData _buildAppTheme() {
  final ThemeData base = ThemeData.dark();

  return base.copyWith(
      brightness: Brightness.dark,
      accentColor: Colors.amber[899],
      primaryColor: Colors.green,
      scaffoldBackgroundColor: Colors.red,
      backgroundColor: Colors.amber,
      textTheme: _appTextTheme(base.textTheme));
}

TextTheme _appTextTheme(TextTheme base) {
  return base
      .copyWith(
          headline5: base.headline5.copyWith(
            fontWeight: FontWeight.w500,
          ),
          headline6: base.headline6.copyWith(
            fontSize: 18.0,
          ),
          caption: base.caption.copyWith(
            fontWeight: FontWeight.w400,
            fontSize: 14.0,
          ),
          button: base.button.copyWith(
            color: Colors.green,
            fontSize: 14,
          ),
          bodyText2: base.bodyText2.copyWith(
            fontSize: 16.9,
            color: Colors.white,
          ))
      .apply(
          fontFamily: "Lobster",
          displayColor: Colors.amber,
          bodyColor: Colors.white);
}

void main() => runApp(new MaterialApp(
/*  theme: _appTheme,
//  theme: ThemeData(
//    brightness: Brightness.dark,
//    primaryColor: Colors.grey[800],
//
//    textTheme: TextTheme(
//      headline: TextStyle(
//        fontSize: 34,
//        fontWeight: FontWeight.bold
//      ),
//      body1: TextStyle(
//        fontSize: 16.9,
//        color: Colors.white,
//      )
//    ),
//

//  ),*/
      home: JsonParsingSimple(),
    ));
