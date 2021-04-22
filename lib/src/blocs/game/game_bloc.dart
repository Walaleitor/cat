import 'package:bloc/bloc.dart';
import 'package:tic_tac_toe/src/models/square.dart';

import 'game_events.dart';
import 'game_states.dart';

class GameBloc extends Bloc<GameEvent, GameState> {
  GameBloc() : super(GameInitial());

  @override
  Stream<GameState> mapEventToState(GameEvent event) async* {
    final currentState = state;
    if (event is SquareSelectedEvent) {
      final game = currentState.game;
      final newgame = game
          .map((Square square) => (square.x == event.x && square.y == event.y)
              ? new Square(event.x, event.y, 'ola')
              : square)
          .toList();
      print(newgame);
      yield GamePlayed(newgame);
    }
  }
}
