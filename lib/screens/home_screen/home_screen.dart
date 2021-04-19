import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:investment/core/models/home_model.dart';
import 'package:investment/screens/home_screen/home_screen_widgets/home_tile.dart';

class HomeScreen extends StatelessWidget {
  // Lista de dados
  final List<HomeModel> dataTiles = [
    HomeModel(
      date: "07/04/21",
      earn: false,
      icon: FontAwesomeIcons.facebook,
      title: "Facebook",
      value: 100.0,
      color: Colors.blue.shade700,
    ),
    HomeModel(
      date: "08/04/21",
      earn: true,
      icon: FontAwesomeIcons.instagram,
      title: "Instagram",
      value: 300.0,
      color: Colors.purple,
    ),
    HomeModel(
      date: "09/04/21",
      earn: false,
      icon: FontAwesomeIcons.linkedin,
      title: "LinkedIn",
      value: 50.0,
      color: Colors.blue,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Cor de fundo
      backgroundColor: Colors.grey.shade300,

      // Conteúdo
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20),
        children: [
          // Carteira
          AspectRatio(
            aspectRatio: 16 / 10.5,
            child: Container(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Sua Carteira",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  // Espaçamento
                  Spacer(),

                  Text(
                    "Total do último balanço",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    "R\$ 48.782,55",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              margin: EdgeInsets.symmetric(vertical: 20),
              decoration: BoxDecoration(
                color: Colors.purple,
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),

          // Lista de investimento
          Text(
            "Investimentos",
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),

          // Conteúdo
          ListView(
            physics: ClampingScrollPhysics(),
            shrinkWrap: true,
            children: dataTiles.map((value) {
              return HomeTile(value);
            }).toList(),
          )
        ],
      ),
    );
  }
}
