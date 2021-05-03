import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NewsTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(15, 15, 15, 0),
      padding: EdgeInsets.all(15),
      height: 150,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          AspectRatio(
            aspectRatio: 1,
            child: Image.asset("assets/logos/apple.png"),
          ),
          SizedBox(width: 15),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                createInfos(
                    text: "Nome da Empresa", size: 18, weight: FontWeight.bold),
                createInfos(text: "CNPJ: 00.000.000/0000-00"),
                createInfos(text: "Valor da empresa: R\$ 68BI"),
                createInfos(text: "Valor da ação: R\$ 46,00"),
                Row(
                  children: [
                    createInfos(
                      text: "Em ascenção",
                      size: 18,
                      weight: FontWeight.bold,
                      color: Colors.green,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Icon(
                      FontAwesomeIcons.arrowUp,
                      size: 15,
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    ); 
  }
  createInfos(
      {@required String text,
      FontWeight weight = FontWeight.normal,
      double size = 13,
      Color color = Colors.black}) {
    return Text(
      text,
      style: TextStyle(
        fontSize: size,
        fontWeight: weight,
        color: color,
      ),
    );
  }
}