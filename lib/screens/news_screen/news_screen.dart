import 'package:flutter/material.dart';
import 'package:investment/screens/news_screen/news_screen_widgets/news_tile.dart';

class NewsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: ListView(
        children: [
          NewsTile(),
          NewsTile(),
          NewsTile(),
          NewsTile(),
          NewsTile(),
          NewsTile(),
          NewsTile(),
          NewsTile(),
          NewsTile(),
        ],
      ),
    );
  }
}
