import 'package:flutter/material.dart';

class DrawerTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final Function onPressed;
  final Color color;

  DrawerTile({
    @required this.icon,
    @required this.title,
    @required this.onPressed,
    @required this.color,
  });

  @override
  Widget build(BuildContext context) {
    /// Cria um tile que sera apresentado no drawer
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
