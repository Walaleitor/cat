import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tic_tac_toe/src/widgets/background.dart';

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
        body: Stack(
      children: [
        Background(),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'CAT',
                style: GoogleFonts.raleway(fontSize: 50.0),
              ),
              SizedBox(
                height: 100.0,
              ),
              _button(
                size,
                onTap: () => Navigator.popAndPushNamed(context, '/game'),
                child: Text(
                  'ENTRAR',
                  style: GoogleFonts.raleway(fontSize: 20.0),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              _button(
                size,
                child: Text(
                  'CREDITOS',
                  style: GoogleFonts.raleway(fontSize: 20.0),
                ),
              )
            ],
          ),
        )
      ],
    ));
  }

  Widget _button(Size size, {Widget child, Function onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 60.0,
        width: size.width * 0.65,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            border: Border.all(color: Colors.black, width: 2.0)),
        child: Center(child: child),
      ),
    );
  }
}
