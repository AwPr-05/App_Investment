import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:investment/core/models/news_model.dart';

class NewsTile extends StatelessWidget {
  final NewsModel value;
  NewsTile({
    @required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(value.companyName),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Valor da ação: R\$ ${value.investmentValue}"),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    createInfos(
                        text: value.isGrowing ? "Em ascenção" : "Em Queda",
                        size: 18,
                        weight: FontWeight.bold,
                        color: value.isGrowing ? Colors.green : Colors.red),
                    SizedBox(
                      width: 10,
                    ),
                    Icon(
                      value.isGrowing
                          ? FontAwesomeIcons.arrowUp
                          : FontAwesomeIcons.arrowDown,
                      size: 15,
                    ),
                  ],
                ),
              ],
            ),
            actions: [
              FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("Fechar"),
                ),
            ],
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.fromLTRB(15, 15, 15, 0),
        padding: EdgeInsets.all(15),
        height: 150,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                  color: value.isGrowing ? Colors.green : Colors.red,
                  spreadRadius: 3,
                  blurRadius: 2)
            ]),
        child: Row(
          children: [
            AspectRatio(
              aspectRatio: 1,
              child: Image.asset(value.image),
            ),
            SizedBox(width: 15),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  createInfos(
                      text: value.companyName,
                      size: 18,
                      weight: FontWeight.bold),
                  createInfos(text: "CNPJ: ${value.cnpj}"),
                  createInfos(
                      text: "Valor da empresa: R\$ ${value.companyValue}"),
                  createInfos(
                      text: "Valor da ação: R\$ ${value.investmentValue}"),
                  Row(
                    children: [
                      createInfos(
                          text: value.isGrowing ? "Em ascenção" : "Em Queda",
                          size: 18,
                          weight: FontWeight.bold,
                          color: value.isGrowing ? Colors.green : Colors.red),
                      SizedBox(
                        width: 10,
                      ),
                      Icon(
                        value.isGrowing
                            ? FontAwesomeIcons.arrowUp
                            : FontAwesomeIcons.arrowDown,
                        size: 15,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
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

// showDialog(
//             context: context,
//             builder: (context) {
//               return AlertDialog(
//                 title: Text(value.companyName),
//                 content: Column(
//                   mainAxisSize: MainAxisSize.min,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text("Valor da ação: R\$ ${value.investmentValue}"),
//                     SizedBox(
//                       height: 10,
//                     ),
//                     Row(
//                       children: [
//                         createInfos(
//                             text: value.isGrowing ? "Em ascenção" : "Em Queda",
//                             size: 18,
//                             weight: FontWeight.bold,
//                             color: value.isGrowing ? Colors.green : Colors.red),
//                         SizedBox(
//                           width: 10,
//                         ),
//                         Icon(
//                           value.isGrowing
//                               ? FontAwesomeIcons.arrowUp
//                               : FontAwesomeIcons.arrowDown,
//                           size: 15,
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//                 actions: [
//                   FlatButton(
//                     onPressed: () {
//                       Navigator.of(context).pop();
//                     },
//                     child: Text("Fechar"),
//                   ),
//                 ],
//               );
//             });
