import 'package:flutter/material.dart';
import 'package:valorant/data/maps_data.dart';
import 'package:valorant/pages/maps.dart';
import 'package:valorant/Components/Map_page_background.dart';

VMapsData vMapsData = VMapsData();

class MapPage extends StatefulWidget {
  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  var controller;
  @override
  void initState() {
    controller = new PageController(initialPage: 0, viewportFraction: 0.95);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFFECE8E1),
        body: Container(
          child: Stack(
            children: [
              WeAreText(color: Color(0xFF8B978F)),
              MapTextDesign(color: Color(0xFF1c252e)),
              MapsPageView(controller: controller),
              BoxesStack(
                  top: 317, left: 0, height: 100, width: 60, opacity: 0.7),
              BoxesStack(top: 342, left: 0, height: 55, width: 35, opacity: 1),
              BoxesStack(
                  top: 317, right: 0, height: 100, width: 80, opacity: 0.7),
              BoxesStack(top: 342, right: 0, height: 55, width: 55, opacity: 1),
              BoxesStack(
                  top: 140, right: 0, height: 50, width: 85, opacity: 0.7),
              ValorantText(color: Color(0xFF8B978F)),
            ],
          ),
        ),
      ),
    );
  }
}

class MapsPageView extends StatelessWidget {
  const MapsPageView({
    @required this.controller,
  });

  final PageController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 147),
      child: Container(
        color: Colors.transparent,
        height: 470,
        child: PageView(
          controller: controller,
          children: [
            BuildMapScreen(
                imgPath: "assets/images/ascent.png",
                tag: 'ASCENT',
                index: 0,
                heroRoute: VMapsAscent()),
            BuildMapScreen(
                imgPath: "assets/images/bind.png",
                tag: 'BIND',
                index: 1,
                heroRoute: VMapsBind()),
            BuildMapScreen(
                imgPath: "assets/images/haven.png",
                tag: 'HAVEN',
                index: 2,
                heroRoute: VMapsHaven()),
            BuildMapScreen(
                imgPath: "assets/images/split.png",
                tag: 'SPLIT',
                index: 3,
                heroRoute: VMapsSplit()),
          ],
        ),
      ),
    );
  }
}

class BoxesStack extends StatelessWidget {
  final double top;
  final double left;
  final double right;
  final double height;
  final double width;
  final double opacity;
  BoxesStack(
      {this.top,
      this.left,
      this.right,
      this.height,
      this.width,
      @required this.opacity});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      right: right,
      left: left,
      child: Container(
        height: height,
        width: width,
        color: Color(0xFFECE8E1).withOpacity(opacity),
      ),
    );
  }
}

class BuildMapScreen extends StatelessWidget {
  final String imgPath;
  final String tag;
  final int index;
  final Widget heroRoute;
  const BuildMapScreen({this.tag, this.imgPath, this.index, this.heroRoute});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10.0),
      child: GestureDetector(
        child: Container(
          child: Column(
            children: [
              Container(
                  color: Colors.transparent,
                  width: double.infinity,
                  child: Hero(
                      tag: tag,
                      child: Image.asset(imgPath, fit: BoxFit.cover))),
              SizedBox(height: 25),
              Container(
                height: 190,
                width: MediaQuery.of(context).size.width,
                color: Color(0xFF1c252e),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Padding(
                        padding: const EdgeInsets.only(right: 65.0, top: 20),
                        child: Text(tag,
                            style: TextStyle(
                                color: Color(0xFFECE8E1), fontSize: 40))),
                    Padding(
                      padding: const EdgeInsets.only(right: 105.0, left: 15),
                      child: Text(vMapsData.mapData[index].description,
                          style: TextStyle(color: Color(0xFFECE8E1)),
                          textAlign: TextAlign.justify),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => heroRoute));
        },
      ),
    );
  }
}
