import 'package:equatable/equatable.dart';

class GameEvent extends Equatable {
  const GameEvent();

  @override
  List<Object> get props => [];
}

class SquareSelectedEvent extends GameEvent {
  int x;
  int y;
  String player;
  SquareSelectedEvent(this.x, this.y, this.player);
}

class GameWaitEvent extends GameEvent {
  String player;
  GameWaitEvent(this.player);
}
