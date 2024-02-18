import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  final String title;
  final VoidCallback? onBack;
  final String? avatarUrl;
  final VoidCallback? onAvatarTap;

  const Header({
    Key? key,
    required this.title,
    this.onBack,
    this.avatarUrl,
    this.onAvatarTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8),
      width: double.infinity,
      color: Theme.of(context).primaryColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (onBack != null)
            InkWell(
              onTap: onBack,
              child: Padding(
                padding: EdgeInsets.all(0),
                child: Icon(Icons.arrow_back, color: Colors.white, size: 24.0),
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
          GestureDetector(
            onTap: onAvatarTap,
            child: avatarUrl == null
                ? Icon(Icons.person, color: Colors.white, size: 24.0)
                : CircleAvatar(
                    backgroundImage: NetworkImage(avatarUrl!),
                    radius: 16,
                    backgroundColor: Colors.grey,
                  ),
          ),
        ],
      ),
    );
  }
}
