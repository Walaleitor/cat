import 'package:equatable/equatable.dart';
import 'package:tic_tac_toe/src/models/square.dart';

class GameState extends Equatable {
  List<Square> game = [];
  GameState();

  get getGame => game;

  set setGame(List<Square> game) => this.game = game;

  @override
  List<Object> get props => [];
}

class GameInitial extends GameState {
  List<Square> game = [
    new Square(0, 0, 'empty'),
    new Square(0, 1, 'empty'),
    new Square(0, 2, 'empty'),
    new Square(1, 0, 'empty'),
    new Square(1, 1, 'empty'),
    new Square(1, 2, 'empty'),
    new Square(2, 0, 'empty'),
    new Square(2, 1, 'empty'),
    new Square(2, 2, 'empty'),
  ];
}

class GamePlayed extends GameState {
  List<Square> game = [];
  GamePlayed(this.game);
}
