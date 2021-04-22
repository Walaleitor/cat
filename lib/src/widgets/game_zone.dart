import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tic_tac_toe/src/blocs/game/game_bloc.dart';
import 'package:tic_tac_toe/src/blocs/game/game_events.dart';
import 'package:tic_tac_toe/src/blocs/game/game_states.dart';
import 'package:tic_tac_toe/src/models/square.dart';
import 'package:tic_tac_toe/src/utils/state_toggle.dart';

class GameZone extends StatefulWidget {
  @override
  _GameZoneState createState() => _GameZoneState();
}

class _GameZoneState extends State<GameZone> {
  @override
  Widget build(BuildContext context) {
    final gameBloc = BlocProvider.of<GameBloc>(context);
    final Size size = MediaQuery.of(context).size;
    return BlocConsumer<GameBloc, GameState>(
      bloc: gameBloc,
      listener: (context, state) {
        if (state is GamePlayed) gameBloc.add(GameWaitEvent(state.played));
      },
      builder: (context, state) {
        return GridView.count(
            physics: NeverScrollableScrollPhysics(),
            crossAxisCount: 3,
            shrinkWrap: true,
            children:
                state.game.map((e) => _squareItem(gameBloc, size, e)).toList());
      },
    );
  }

  Widget _squareItem(GameBloc bloc, Size size, Square square) {
    final squareSize = (size.width - 30.0) / 3;
    return Padding(
      padding: EdgeInsets.all(5.0),
      child: GestureDetector(
        onTap: () {
          bloc.add(SquareSelectedEvent(
              square.x, square.y, stateToggle(square.state)));
        },
        child: Container(
            height: squareSize,
            width: squareSize,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              border: Border.all(width: 2.0),
            ),
            child: _toggleXorCircle(square.state)),
      ),
    );
  }

  Widget _toggleXorCircle(String state) {
    if (state == 'circle')
      return CustomPaint(
        painter: _CirclePainter(),
      );
    if (state == 'ex')
      return CustomPaint(
        painter: _XPainter(),
      );
    return Container();
  }
}

class _CirclePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = new Paint()
      ..color = Colors.red
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 10.0;

    canvas.drawCircle(
        Offset(size.width * 0.5, size.height * 0.5), size.width * 0.4, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class _XPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = new Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 10.0;

    final path = new Path()
      ..moveTo(size.width * 0.2, size.height * 0.2)
      ..lineTo(size.width * 0.8, size.height * 0.8)
      ..moveTo(size.width * 0.2, size.height * 0.8)
      ..lineTo(size.width * 0.8, size.height * 0.2);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
