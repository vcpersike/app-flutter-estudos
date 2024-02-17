import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Text(
        '© 2023 Sua Empresa',
        style: Theme.of(context).textTheme.caption,
      ),
    );
  }
}
