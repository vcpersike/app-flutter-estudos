import 'package:estudos/firebase_options.dart';
import 'package:estudos/models/forms/utils_names/router_names_model.dart';
import 'package:estudos/services/authentication_service.dart';
import 'package:estudos/views/login/sign_up_page.dart';
import 'package:estudos/views/register_client/register_client_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:estudos/thema.dart';
import 'package:estudos/views/perfil/perfil_page.dart';

import 'package:estudos/views/image_upload/image_upload_page.dart';
import 'package:estudos/views/sprint/sprint_page.dart';
import 'package:estudos/views/budget/budget_pages.dart';
import 'package:estudos/views/graphics/graphics_page.dart';
import 'package:estudos/views/login/login_page.dart';
import 'package:estudos/views/menu/menu_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
        routePaths[RouteNames.sprint]!: (context) => SprintPage(),
        routePaths[RouteNames.registerClient]!: (context) => RegisterClientPage(),
        routePaths[RouteNames.forms]!: (context) => BudgetPage(),
        routePaths[RouteNames.graphics]!: (context) => GraphicsPage(),
        routePaths[RouteNames.imageUpload]!: (context) => ImageUploadPage(),
        routePaths[RouteNames.profile]!: (context) => ProfilePage(
            title: 'Perfil', authenticationService: authenticationService),
        routePaths[RouteNames.signUp]!: (context) => const SignUpPage(),
      },
    );
  }
}
