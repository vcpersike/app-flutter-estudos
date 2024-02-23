import 'package:flutter/material.dart';

import 'package:estudos/thema.dart';
import 'package:estudos/views/perfil/perfil_page.dart';

import 'package:estudos/views/image_upload/image_upload_page.dart';
import 'package:estudos/views/excel/excel_page.dart';
import 'package:estudos/views/forms/forms_pages.dart';
import 'package:estudos/views/graphics/graphics_page.dart';
import 'package:estudos/views/login/login_page.dart';
import 'package:estudos/views/menu/menu_page.dart';
import 'package:estudos/views/pdf/pdf_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Seu Aplicativo',
      theme: appTheme(),
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginPage(title: 'Login'),
        '/menu': (context) => MenuPage(),
        '/excel': (context) => ExcelPage(),
        '/pdf':(context) => PdfPage(),
        '/forms':(context) => FormsPage(),
        '/graphics':(context) => GraphicsPage(),
        '/imageUpload': (context) => ImageUploadPage(),
        '/perfil': (context) => ProfilePage(),
      },
    );
  }
}
