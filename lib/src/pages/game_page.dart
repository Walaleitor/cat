import 'package:flutter/material.dart';
import 'package:tic_tac_toe/src/widgets/background.dart';
import 'package:tic_tac_toe/src/widgets/game_zone.dart';

class GamePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Background(),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [GameZone()],
          )
        ],
      ),
    );
  }
}
