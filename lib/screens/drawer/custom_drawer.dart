import 'package:flutter/material.dart';
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

 /// Navega entre as paginas pelo botão selecionado no drawer
  void changePage({@required int buttonIndex, @required int page}) {
    // Selecionando o botão
    setState(() => currentDrawerIndex = buttonIndex);

    // Passando para a tela no pageview
    widget.pageController.jumpToPage(page);

    // Fechar o drawer
    widget.scaffoldKey.currentState.openEndDrawer();
  }

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
                DrawerHeader(
                  child: Container(
                    alignment: Alignment.center,
                    color: Colors.red,
                    child: Text(
                      "Header",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 20,
                  right: 15,
                  child: IconButton(
                    icon: Icon(
                      Icons.arrow_back_ios,
                      size: 30,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      widget.scaffoldKey.currentState.openEndDrawer();
                    },
                  ),
                ),
              ],
            ),
          ),

          // Telas extras
          DrawerTile(
            icon: Icons.home,
            title: "Telas extras",
            onPressed: () {
              changePage(buttonIndex: 0, page: 3);
            },
            color:
                currentDrawerIndex == 0 ? Colors.grey.shade300 : Colors.black,
          ),

          // Investimentos
          DrawerTile(
            icon: Icons.monetization_on,
            title: "Investimentos",
            onPressed: () {
             changePage(buttonIndex: 1, page: 4);
            },
            color:
                currentDrawerIndex == 1 ? Colors.grey.shade300 : Colors.black,
          ),

          // Despezas
          DrawerTile(
            icon: Icons.money_off,
            title: "Despezas",
            onPressed: () {
              setState(() => currentDrawerIndex = 2);
            },
            color:
                currentDrawerIndex == 2 ? Colors.grey.shade300 : Colors.black,
          ),

          // Gráficos
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
