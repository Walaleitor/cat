import 'package:bloc/bloc.dart';

import 'game_events.dart';
import 'game_states.dart';

class GameBloc extends Bloc<GameEvent, GameState> {
  GameBloc() : super(GameInitial());

  @override
  Stream<GameState> mapEventToState(GameEvent event) async* {}
}
