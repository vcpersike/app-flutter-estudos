import 'package:estudos/components/footer.dart';
import 'package:flutter/material.dart';


class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Header(
              title: 'Perfil',
              onHome: () => Navigator.pushNamed(context, '/menu'),
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

  const Header({super.key, required this.title, this.onHome});

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
          const Opacity(opacity: 0, child: Icon(Icons.home, size: 24.0)),
        ],
      ),
    );
  }
}
