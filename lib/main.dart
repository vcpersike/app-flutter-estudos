import 'package:estudos/views/costumer_service/costumer_service_page.dart';
import 'package:estudos/views/excel/excel_page.dart';
import 'package:estudos/views/forms/forms_pages.dart';
import 'package:estudos/views/graphics/graphics_page.dart';
import 'package:estudos/views/login/login_page.dart';
import 'package:estudos/views/menu/menu_page.dart';
import 'package:estudos/views/pdf/pdf_page.dart';
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
        '/menu': (context) => MenuPage(),
        '/excel': (context) => ExcelPage(),
        '/pdf':(context) => PdfPage(),
        '/forms':(context) => FormsPage(),
        '/graphics':(context) => GraphicsPage(),
        '/customerService': (context) => CustomerServicePage(),
      },
    );
  }
}
