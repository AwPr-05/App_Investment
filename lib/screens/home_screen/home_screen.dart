import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:investment/core/models/home_model.dart';
import 'package:investment/screens/home_screen/home_screen_widgets/home_tile.dart';

class HomeScreen extends StatelessWidget {
  final List<HomeModel> dataTiles = [
    HomeModel(
      date: "07/04/2021",
      earn: false,
      icon: FontAwesomeIcons.facebook,
      title: "Fabebook",
      value: 100.0,
    ),
    HomeModel(
      date: "08/04/2021",
      earn: true,
      icon: FontAwesomeIcons.instagram,
      title: "Instagram",
      value: 300.0,
    ),
    HomeModel(
      date: "09/04/2021",
      earn: false,
      icon: FontAwesomeIcons.linkedin,
      title: "Linkedin",
      value: 50.0,
    )
  ];

  /// Retorna um Container/Container Icon
  Widget creatContainerIcon() {
    return Container(
      height: 40,
      width: 40,
      margin: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        title: Text("Investment"),
        centerTitle: true,
        leading: creatContainerIcon(),
        actions: [
          creatContainerIcon(),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20),
        children: [
          // carteira
          AspectRatio(
            aspectRatio: 16 / 10.5,
            child: Container(
              padding: EdgeInsets.all(16),
              margin: EdgeInsets.symmetric(vertical: 20),
              decoration: BoxDecoration(
                color: Colors.purple,
                borderRadius: BorderRadius.circular(20),
              ),
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
                    "R\$ 52.500,55",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Lista de Investimentos
          Text(
            "Investimentos",
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),

          // conteudo
          ListView(
            shrinkWrap: true,
            children: [


              HomeTile(
                date: "12ABR21",
                icon: Icons.store,
                title: "Netflix",
                value: 300,
                earn: true,
              ),


              HomeTile(
                date: "12ABR21",
                icon: Icons.store,
                title: "Amazon",
                value: 500,
                earn: false,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
