import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  final String title;
  final VoidCallback? onBack;

  const Header({Key? key, required this.title, this.onBack}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      width: double.infinity,
      color: Theme.of(context).primaryColor,
      child: Row(
        children: [
          if (onBack != null)
          Container(
              height: 16,
              alignment: Alignment.center,
              child: IconButton(
                icon: Icon(Icons.arrow_back, color: Colors.white),
                onPressed: onBack,
                padding: EdgeInsets.zero,
                iconSize: 24,
                alignment: Alignment.center,
              ),
            ),
          Expanded(
            child: Text(
              title,
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
