import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:tic_tac_toe/bloc_observer.dart';
import 'package:tic_tac_toe/src/app.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  runApp(MyApp());
}
