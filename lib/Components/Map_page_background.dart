import 'package:flutter/material.dart';

class MapTextDesign extends StatelessWidget {
  final Color color;
  MapTextDesign({this.color});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(30, 40, 10, 10),
      child: Text('Maps',
          style: TextStyle(
              fontSize: 90, fontWeight: FontWeight.w800, color: color)),
    );
  }
}

class WeAreText extends StatelessWidget {
  final Color color;
  WeAreText({this.color});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8.0, 0, 30, 0),
      child: FittedBox(
        fit: BoxFit.cover,
        child: Text('WE ARE',
            style: TextStyle(
                fontSize: MediaQuery.of(context).size.width,
                foreground: Paint()
                  ..style = PaintingStyle.stroke
                  ..strokeWidth = 10
                  ..color = color)),
      ),
    );
  }
}

class ValorantText extends StatelessWidget {
  final Color color;
  ValorantText({this.color});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 120.0),
      child: Align(
        alignment: Alignment.topRight,
        child: RotatedBox(
          quarterTurns: 1,
          child: FittedBox(
            fit: BoxFit.cover,
            child: Text('VALORANT',
                style: TextStyle(
                    fontSize: MediaQuery.of(context).size.height,
                    foreground: Paint()
                      ..style = PaintingStyle.stroke
                      ..strokeWidth = 15
                      ..color = color)),
          ),
        ),
      ),
    );
  }
}
