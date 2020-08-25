import 'package:flutter/material.dart';
import 'package:valorant/Components/Map_page_background.dart';

var controller;

class VMapsBind extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MapsInfoPage(
      tag: 'BIND',
      mapImgPath: "assets/images/mapsGallary/bind2.png",
      imgPath1: "assets/images/mapsGallary/bind1.jpg",
      imgPath2: "assets/images/mapsGallary/bind4.jpg",
      imgPath3: "assets/images/mapsGallary/bind5.jpg",
      imgPath4: "assets/images/mapsGallary/bind6.jpg",
    );
  }
}

class VMapsHaven extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MapsInfoPage(
      tag: 'HAVEN',
      mapImgPath: "assets/images/mapsGallary/haven5.png",
      imgPath1: "assets/images/mapsGallary/haven1.jpg",
      imgPath2: "assets/images/mapsGallary/haven2.jpg",
      imgPath3: "assets/images/mapsGallary/haven3.jpg",
      imgPath4: "assets/images/mapsGallary/haven4.jpg",
    );
  }
}

class VMapsSplit extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MapsInfoPage(
      tag: 'SPLIT',
      mapImgPath: "assets/images/mapsGallary/split5.png",
      imgPath1: "assets/images/mapsGallary/split1.jpg",
      imgPath2: "assets/images/mapsGallary/split2.jpg",
      imgPath3: "assets/images/mapsGallary/split3.jpg",
      imgPath4: "assets/images/mapsGallary/split4.jpg",
    );
  }
}

class VMapsAscent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MapsInfoPage(
      tag: 'ASCENT',
      mapImgPath: "assets/images/mapsGallary/ascentminimap.jpg",
      imgPath1: "assets/images/mapsGallary/ascent1.jpg",
      imgPath2: "assets/images/mapsGallary/ascent2.jpg",
      imgPath3: "assets/images/mapsGallary/ascent3.jpg",
      imgPath4: "assets/images/mapsGallary/ascent4.jpg",
    );
  }
}

class MapsInfoPage extends StatelessWidget {
  final String tag;
  final String mapImgPath;
  final String imgPath1;
  final String imgPath2;
  final String imgPath3;
  final String imgPath4;

  MapsInfoPage(
      {this.tag,
      this.mapImgPath,
      this.imgPath1,
      this.imgPath2,
      this.imgPath3,
      this.imgPath4});

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: tag,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Color(0xFF8B978F),
          body: Container(
            child: Stack(
              children: [
                WeAreText(color: Color(0xFFE2DFD8)),
                ValorantText(color: Color(0xFFE2DFD8)),
                MapTextDesign(color: Color(0xFF1c252e)),
                MiniMapPosition(mapImgPath: mapImgPath),
                MapsGallary(
                    imgPath1: imgPath1,
                    imgPath2: imgPath2,
                    imgPath3: imgPath3,
                    imgPath4: imgPath4)
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MiniMapPosition extends StatelessWidget {
  MiniMapPosition({
    @required this.mapImgPath,
  });

  final String mapImgPath;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 130,
      child: Padding(
          padding: const EdgeInsets.all(20),
          child: Container(
            height: MediaQuery.of(context).size.height / 3,
            child: Image(image: AssetImage(mapImgPath)),
          )),
    );
  }
}

class MapsGallary extends StatelessWidget {
  MapsGallary({
    @required this.imgPath1,
    @required this.imgPath2,
    @required this.imgPath3,
    @required this.imgPath4,
  });

  final String imgPath1;
  final String imgPath2;
  final String imgPath3;
  final String imgPath4;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 420),
      child: Container(
        color: Colors.transparent,
        height: 280,
        child: PageView(controller: controller, children: [
          MapGallary(impPath: imgPath1),
          MapGallary(impPath: imgPath2),
          MapGallary(impPath: imgPath3),
          MapGallary(impPath: imgPath4)
        ]),
      ),
    );
  }
}

class MapGallary extends StatelessWidget {
  final String impPath;
  MapGallary({this.impPath});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SizedBox(
          width: double.infinity,
          child: Image.asset(
            impPath,
          ),
        ),
      ),
    );
  }
}
