import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tic_tac_toe/bloc_observer.dart';
import 'package:tic_tac_toe/src/app.dart';
import 'package:tic_tac_toe/src/blocs/game/game_bloc.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  runApp(MultiBlocProvider(
      providers: [BlocProvider(create: (BuildContext context) => GameBloc())],
      child: MyApp()));
}
