import 'package:estudos/components/footer.dart';
import 'package:estudos/components/header.dart';
import 'package:flutter/material.dart';

class ExcelPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SafeArea(
              child: Padding(
                padding: EdgeInsets.zero,
                child: Header(title: 'Excel',
                onBack: () => Navigator.pop(context),
                onAvatarTap: () => Navigator.pushNamed(context, '/perfil'),
                ),
              ),
            ),
          Expanded(
            child: Center(
              child: Text('Tela de visualização Excel'),
            ),
          ),
          Footer(),
        ],
      ),
    );
  }
}
