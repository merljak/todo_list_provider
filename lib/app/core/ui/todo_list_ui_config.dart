import 'package:flutter/material.dart';



class TodoListUiConfig{
  TodoListUiConfig._();
  static ThemeData get theme => ThemeData(
    //textTheme: GoogleFonts.abhayaLibreTextTheme() ,
    primaryColor: const Color(0xff5C77CE),
    primaryColorLight: const Color(0xffABC8F7),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white, 
        backgroundColor: const Color(0xff5C77CE),
      ),
    )

  );
}