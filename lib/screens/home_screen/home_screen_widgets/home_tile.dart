import 'package:flutter/material.dart';
import 'package:investment/core/models/home_model.dart';

class HomeTile extends StatelessWidget {
  final HomeModel values;

  HomeTile(this.values);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(),
      ),
      child: ListTile(
        dense: true,
        leading: Icon(
          values.icon,
          size: 40,
          color: values.color,
        ),
        title: Text(
          values.title,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(values.date),
        trailing: Text(
          "R\$ ${values.value.toStringAsFixed(2).replaceAll(".", ",")}",
          style: TextStyle(
            fontSize: 16,
            color: values.earn ? Colors.green : Colors.red,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      margin: EdgeInsets.only(top: 20),
    );
  }
}
