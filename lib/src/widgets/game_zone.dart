import 'package:flutter/material.dart';

class GameZone extends StatefulWidget {
  @override
  _GameZoneState createState() => _GameZoneState();
}

class _GameZoneState extends State<GameZone> {
  final array = [
    [0, 0],
    [0, 1],
    [0, 2],
    [1, 0],
    [1, 1],
    [1, 2],
    [2, 0],
    [2, 1],
    [2, 2]
  ];

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return GridView.count(
      physics: NeverScrollableScrollPhysics(),
      crossAxisCount: 3,
      shrinkWrap: true,
      children: [
        _squareItem(
          size,
          position: [0, 0],
        ),
        _squareItem(
          size,
          position: [0, 1],
        ),
        _squareItem(
          size,
          position: [0, 2],
        ),
        _squareItem(
          size,
          position: [1, 0],
        ),
        _squareItem(
          size,
          position: [1, 1],
        ),
        _squareItem(
          size,
          position: [1, 2],
        ),
        _squareItem(
          size,
          position: [2, 0],
        ),
        _squareItem(
          size,
          position: [2, 1],
        ),
        _squareItem(size, position: [2, 2]),
      ],
    );
  }

  Widget _squareItem(Size size, {List<int> position}) {
    final squareSize = (size.width - 30.0) / 3;
    return Padding(
      padding: EdgeInsets.all(5.0),
      child: GestureDetector(
        onTap: () {
          print('tocando ${array[3]}');
        },
        child: Container(
          height: squareSize,
          width: squareSize,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            border: Border.all(width: 2.0),
          ),
          child: CustomPaint(
            painter: _CirclePainter(),
          ),
        ),
      ),
    );
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
