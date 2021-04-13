import 'package:flutter/material.dart';
import 'package:investment/screens/pages_navigator/pages_navigator.dart';

main(List<String> args) => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Investment",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: PagesNavigator(),
    );
  }
}
