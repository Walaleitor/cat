import 'package:flutter/material.dart';
import 'package:tic_tac_toe/src/pages/first_page.dart';
import 'package:tic_tac_toe/src/pages/game_page.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: <String, WidgetBuilder>{
        '/': (BuildContext context) => FirstPage(),
        '/game': (BuildContext context) => GamePage(),
      },
    );
  }
}
