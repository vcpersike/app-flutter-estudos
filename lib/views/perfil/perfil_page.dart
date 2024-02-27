import 'package:estudos/components/footer.dart';
import 'package:estudos/models/forms/utils_names/router_names_model.dart';
import 'package:estudos/services/authentication_service.dart';
import 'package:estudos/viewmodels/login_viewmodel.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  final String title;
  final LogoutViewModel _logoutViewModel;

  ProfilePage({Key? key, required this.title, required AuthenticationService authenticationService})
      : _logoutViewModel = LogoutViewModel(authenticationService),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Header(
              title: 'Perfil',
              onHome: () => Navigator.pushNamed(context, routePaths[RouteNames.menu]!),
              onLogout: () => _logoutViewModel.logout(context),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.person, size: 120, color: Theme.of(context).colorScheme.primary),
                  const SizedBox(height: 20),
                  Text(
                    'Nome do Usuário',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  ElevatedButton(
                    onPressed: () => _logoutViewModel.logout(context),
                    child: Text('Sair'),
                  ),
                ],
              ),
            ),
            Footer(),
          ],
        ),
      ),
    );
  }
}

class Header extends StatelessWidget {
  final String title;
  final VoidCallback? onHome;
  final VoidCallback? onLogout;

  const Header({Key? key, required this.title, this.onHome, this.onLogout}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8),
      width: double.infinity,
      color: Theme.of(context).primaryColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (onHome != null)
            InkWell(
              onTap: onHome,
              child: const Padding(
                padding: EdgeInsets.all(0),
                child: Icon(Icons.home, color: Colors.white, size: 24.0),
              ),
            ),
          Text(
            title,
            style: const TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold, color: Colors.white),
            textAlign: TextAlign.center,
          ),
          // Adiciona um botão de sair se o callback estiver disponível
          if (onLogout != null)
            InkWell(
              onTap: onLogout,
              child: const Padding(
                padding: EdgeInsets.all(0),
                child: Icon(Icons.exit_to_app, color: Colors.white, size: 24.0),
              ),
            ),
        ],
      ),
    );
  }
}
