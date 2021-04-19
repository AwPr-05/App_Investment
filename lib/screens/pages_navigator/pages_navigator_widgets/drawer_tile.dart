import 'package:flutter/material.dart';

class DrawerTile extends StatelessWidget {
  final IconData icon;
  final Function onPressed;
  final String title;
  final Color color;

  const DrawerTile({
    @required this.icon,
    @required this.onPressed,
    @required this.title,
    @required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onPressed,
      leading: Icon(
        icon,
        size: 30,
        color: color,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 16,
          color: color,
        ),
      ),
    );
  }
}
