import 'package:flutter/material.dart';
import 'package:fshoes/ui/page/HomePage.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Elos Shoes",
      theme: ThemeData(
          brightness: Brightness.light,
          primarySwatch: Colors.blue,
          fontFamily: 'Google'),
      home: HomePage(),
    ));
