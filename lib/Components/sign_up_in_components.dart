import 'package:flutter/material.dart';

class CoverImage extends StatelessWidget {
  final String imgPath;
  CoverImage({this.imgPath});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 250,
      decoration: BoxDecoration(
          image:
              DecorationImage(image: AssetImage(imgPath), fit: BoxFit.cover)),
      child: Align(
        alignment: Alignment.topLeft,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              width: 40,
              height: 40,
              child: Icon(Icons.arrow_back_ios, color: Colors.white, size: 30),
            ),
          ),
        ),
      ),
    );
  }
}

class ValorantTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(25, 30, 25, 5),
      child: Container(
        height: 90,
        child: Stack(
          children: [
            Positioned(
              left: 0,
              child: Container(
                  decoration: BoxDecoration(
                      color: Color(0xFFFF4554),
                      borderRadius: BorderRadius.circular(5)),
                  height: 15,
                  width: 15),
            ),
            Center(
              child: Text('WE ARE VALORANT',
                  style: TextStyle(
                      fontSize: 50,
                      fontFamily: 'Anton',
                      color: Color(0xFF1c252e),
                      fontWeight: FontWeight.w500,
                      letterSpacing: .6)),
            ),
            Positioned(
              right: 0,
              bottom: 0,
              child: Container(
                  decoration: BoxDecoration(
                      color: Color(0xFFB7B9BC),
                      borderRadius: BorderRadius.circular(5)),
                  height: 15,
                  width: 15),
            ),
          ],
        ),
      ),
    );
  }
}
