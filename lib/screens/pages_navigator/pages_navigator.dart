import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:investment/screens/home_screen/home_screen.dart';
import 'package:investment/screens/drawer/custom_drawer.dart';

class PagesNavigator extends StatefulWidget {
  @override
  _PagesNavigatorState createState() => _PagesNavigatorState();
}

class _PagesNavigatorState extends State<PagesNavigator> {
  /// Retorna um container icon
  Widget createContainerIcon() {
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

  final pageController = PageController(initialPage: 1);

  int currentBottomNavIndex = 1;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,

      // AppBar
      appBar: AppBar(
        title: Text("Investment"),
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            scaffoldKey.currentState.openDrawer();
          },
          child: Image.asset("assets/hamburger.png"),
        ),
        actions: [
          createContainerIcon(),
        ],
      ),

      // Drawer
      drawer: CustomDrawer(
        scaffoldKey: scaffoldKey,
        pageController: pageController,
      ),

      // Conteúdo
      body: PageView(
        controller: pageController,
        physics: NeverScrollableScrollPhysics(),
        children: [
          Container(color: Colors.red),
          HomeScreen(),
          Container(color: Colors.blue),
          Container(
            color: Colors.green,
            alignment: Alignment.center,
            child: Text(
              "Telas extras",
              style: TextStyle(
                color: Colors.orange.shade900,
                fontSize: 20,
              ),
            ),
          ),
          Container(
            color: Colors.green,
            alignment: Alignment.center,
            child: Text(
              "Investimento",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),

      // Bottom Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.purple,
        currentIndex: currentBottomNavIndex,
        selectedItemColor: Colors.white,
        onTap: (index) {
          setState(() {
            currentBottomNavIndex = index;
            pageController.jumpToPage(index);
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.moneyBillWave),
            label: "Investir",
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.history),
            label: "Histórico",
          ),
        ],
      ),
    );
  }
}
