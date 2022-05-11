import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';

ThemeData lightmode = ThemeData(
appBarTheme: AppBarTheme(systemOverlayStyle: SystemUiOverlayStyle(statusBarColor: Colors.black),elevation: 0,backgroundColor: HexColor('FFFFFF')),
  backgroundColor: HexColor('FFFFFF'),
    scaffoldBackgroundColor:HexColor('FFFFFF') ,
    textTheme: TextTheme(
        headline5: TextStyle(fontFamily: 'DINM',color: HexColor('000000')),
        headline3: TextStyle(fontFamily: 'DINR', fontSize: 18,color: HexColor('000000'))));
