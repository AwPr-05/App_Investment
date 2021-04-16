import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:investment/screens/pages_navigator/pages_navigator_widgets/drawer_tile.dart';

class CustomDrawer extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  final PageController pageController;
  CustomDrawer({this.scaffoldKey, this.pageController});

  @override
  _CustomDrawerState createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  int currentDrawerIndex;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.75,
      decoration: BoxDecoration(
        color: Colors.purple,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(50),
          bottomRight: Radius.circular(50),
        ),
      ),
      child: Column(
        children: [
          // Cabeçalho do Drawer
          SafeArea(
            child: Stack(
              children: [
                // Fta
                DrawerHeader(
                  child: Container(
                      color: Colors.red,
                      alignment: Alignment.center,
                      child: Text(
                        "Header",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      )),
                ),

                // Botao de volta Drawer
                Positioned(
                    top: 20,
                    right: 15,
                    child: IconButton(
                      icon: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.grey.shade300,
                        size: 30,
                      ),
                      onPressed: () {
                        widget.scaffoldKey.currentState.openEndDrawer();
                      },
                    )),
              ],
            ),
          ),

          // Tile - Telas Extras
          DrawerTile(
            icon: FontAwesomeIcons.airbnb,
            title: "Telas Extras",
            onPressed: () {
              setState(() => currentDrawerIndex = 0);
              widget.pageController.jumpToPage(3);
              widget.scaffoldKey.currentState.openEndDrawer();
            },
            color:
                currentDrawerIndex == 0 ? Colors.grey.shade300 : Colors.black,
          ),

          // Tile - Investimentos
          DrawerTile(
            icon: FontAwesomeIcons.piggyBank,
            title: "Investimentos",
            onPressed: () {
              setState(() => currentDrawerIndex = 1);
            },
            color:
                currentDrawerIndex == 1 ? Colors.grey.shade300 : Colors.black,
          ),

          // Tile - Despezas
          DrawerTile(
            icon: Icons.money_off,
            title: "Despezas",
            onPressed: () {
              setState(() => currentDrawerIndex = 2);
            },
            color:
                currentDrawerIndex == 2 ? Colors.grey.shade300 : Colors.black,
          ),

          // Tile - Gráficos
          DrawerTile(
            icon: Icons.bar_chart,
            title: "Gráficos",
            onPressed: () {
              setState(() => currentDrawerIndex = 3);
            },
            color:
                currentDrawerIndex == 3 ? Colors.grey.shade300 : Colors.black,
          ),
        ],
      ),
    );
  }
}
