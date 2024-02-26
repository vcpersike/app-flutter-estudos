import 'package:estudos/models/router_names.dart';
import 'package:estudos/services/authentication_service.dart';
import 'package:estudos/views/login/cadastro_login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
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

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const GamboaApp());
}

class GamboaApp extends StatelessWidget {
  const GamboaApp({super.key});

  @override
  Widget build(BuildContext context) {
    final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

    final AuthenticationService authenticationService =
        AuthenticationService(firebaseAuth);

    return MaterialApp(
      title: 'Gamboa Aplicativo',
      theme: appTheme(),
      initialRoute: '/',
      routes: {
        routePaths[RouteNames.login]!: (context) =>
            const LoginPage(title: 'Login'),
        routePaths[RouteNames.menu]!: (context) => const MenuPage(),
        routePaths[RouteNames.excel]!: (context) => ExcelPage(),
        routePaths[RouteNames.pdf]!: (context) => PdfPage(),
        routePaths[RouteNames.forms]!: (context) => FormsPage(),
        routePaths[RouteNames.graphics]!: (context) => GraphicsPage(),
        routePaths[RouteNames.imageUpload]!: (context) => ImageUploadPage(),
        routePaths[RouteNames.profile]!: (context) => ProfilePage(
            title: 'Perfil', authenticationService: authenticationService),
        routePaths[RouteNames.signUp]!: (context) => const SignUpPage(),
      },
    );
  }
}
