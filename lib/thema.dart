import 'package:flutter/material.dart';

ThemeData appTheme() {
  const darkGreen = Color(0xFF005000);
  const lightGrey = Color(0xFFF5F5F5);

  return ThemeData(
    primaryColor: darkGreen,
    scaffoldBackgroundColor: lightGrey, // Cor de fundo padrão para telas
    colorScheme: ColorScheme.light(
      primary: darkGreen,
      onPrimary: Colors.white, // Para garantir contraste no AppBar e outros elementos sobre o primaryColor
      secondary: Colors.grey,
      onSecondary: Colors.black,
      surface: lightGrey, // Cor de superfície (usada por padrão em Cards, Drawers, etc.)
      onSurface: Colors.black, // Cor do texto/icons em superfícies
      background: lightGrey, // Cor de fundo geral (pode ser usada como cor de fundo de Scaffold)
      onBackground: darkGreen, // Cor de texto/icons sobre o fundo geral
    ),
    appBarTheme: AppBarTheme(
      color: darkGreen,
      iconTheme: IconThemeData(color: Colors.white),
      titleTextStyle: TextStyle(color: Colors.white, fontSize: 20), // Estilo do título do AppBar
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        primary: darkGreen, // Cor do texto do botão
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        primary: darkGreen, // Cor de fundo do botão elevado
        onPrimary: Colors.white, // Cor do texto/icon no botão elevado
      ),
    ),
    // Configura outros componentes do tema conforme necessário...
  );
}
