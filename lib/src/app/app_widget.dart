import 'package:flutter/material.dart';
import 'package:redditnews/src/home/home_module.dart';

class AppWidget extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Reddit News',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: HomeModule(),
    );
  }
}

