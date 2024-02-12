import 'package:estudos/views/login/login_page.dart';
import 'package:estudos/views/menu/menu_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Seu Aplicativo',
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginPage(title: 'Login'),
        '/menu': (context) => MenuPage(), // Adicionando a rota para a página do menu
      },
    );
  }
}
