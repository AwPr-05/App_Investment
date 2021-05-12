import 'package:flutter/material.dart';
import 'package:investment/core/models/news_model.dart';
import 'package:investment/screens/news_screen/news_screen_widgets/news_tile.dart';

class NewsScreen extends StatelessWidget {
  List<NewsModel> newsModelList = [
    NewsModel(
      image: "assets/logos/apple.png",
      cnpj: "00.000.000/0001-00",
      companyName: "Apple",
      companyValue: "46BI",
      investmentValue: 46,
      isGrowing: true,
    ),
    NewsModel(
      image: "assets/logos/google.png",
      cnpj: "00.000.000/0001-00",
      companyName: "Google",
      companyValue: "48BI",
      investmentValue: 50,
      isGrowing: false,
    ),
    NewsModel(
      image: "assets/logos/nasa.png",
      cnpj: "00.000.000/0001-00",
      companyName: "Nasa",
      companyValue: "1TRI",
      investmentValue: 160,
      isGrowing: true,
    ),
    NewsModel(
      image: "assets/logos/nokia.png",
      cnpj: "00.000.000/0001-00",
      companyName: "Nasa",
      companyValue: "10",
      investmentValue: 0.25,
      isGrowing: false,
    ),
    NewsModel(
      image: "assets/logos/cocacola.png",
      cnpj: "00.000.000/0001-00",
      companyName: "Cocacola",
      companyValue: "40BI",
      investmentValue: 30,
      isGrowing: true,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: ListView(
        children: newsModelList.map((value) => NewsTile(value: value)).toList(),
      ),
    );
  }
}
