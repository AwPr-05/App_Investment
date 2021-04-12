import 'package:flutter/material.dart';

class HomeTile extends StatelessWidget {
  final String title;
  final String date;
  final double value;
  final IconData icon;
  final bool earn;

  HomeTile({
    @required this.title,
    @required this.date,
    @required this.value,
    @required this.icon,
    @required this.earn,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(),
      ),
      child: ListTile(
        leading: Icon(
          icon,
          size: 40,
        ),
        title: Text(
          title,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(date),
        trailing: Text(
          "R\$ ${value.toStringAsFixed(2).replaceAll(".", ",")}",
          style: TextStyle(
              fontSize: 16,
              color: earn ? Colors.green : Colors.red,
              fontWeight: FontWeight.w600),
        ),
      ),
      margin: EdgeInsets.only(top: 20),
    );
  }
}
