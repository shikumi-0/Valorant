import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 30, 20, 15),
              child: Container(
                height: 200,
                width: double.infinity,
                child: ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  children: [
                    _buildPatchNote('assets/images/906.jpg', '28/05/2020', 1.0),
                    _buildPatchNote('assets/images/908.jpg', '08/07/2020', 2.0),
                    _buildPatchNote('assets/images/911.jpg', '28/08/2020', 2.2),
                    _buildPatchNote('assets/images/909.jpg', '20/09/2020', 2.4),
                  ],
                ),
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
                    child: Text('Featured News',
                        style: TextStyle(
                            color: Color(0xFF1c252e),
                            fontSize: 30,
                            fontWeight: FontWeight.w700)),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                    child: Text(
                      'View all',
                      style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: Color(0xff4cd964),
                          fontSize: 20),
                    ),
                  ),
                ],
              ),
            ),
            Flexible(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(15, 30, 20, 0),
                child: Container(
                  height: 400,
                  width: double.infinity,
                  child: ListView(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    children: [
                      _buildNews('assets/images/907.jpg', '28/05/2020'),
                      _buildNews('assets/images/910.jpg', '08/07/2020'),
                      _buildNews('assets/images/911.jpg', '28/08/2020'),
                      _buildNews('assets/images/905.jpg', '20/09/2020'),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPatchNote(String imgPath, String date, double patchVersion) {
    return Padding(
      padding:
          const EdgeInsets.only(right: 10.0, top: 15, bottom: 15, left: 10),
      child: Container(
        width: 250,
        decoration: BoxDecoration(
            image:
                DecorationImage(image: AssetImage(imgPath), fit: BoxFit.cover),
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.4),
                  offset: Offset(0, 5),
                  blurRadius: 5.0),
            ]),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: LinearGradient(colors: [
                Colors.black.withOpacity(.8),
                Colors.black.withOpacity(0.3)
              ], begin: Alignment.bottomRight)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 12.0),
                child: Text(date,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontFamily: 'Raleway')),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12.0, bottom: 15, top: 10),
                child: Text('VALORANT PATCH NOTE $patchVersion',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontFamily: 'Raleway')),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNews(String imgPath, String date) {
    return Padding(
      padding:
          const EdgeInsets.only(right: 10.0, top: 15, bottom: 15, left: 10),
      child: Container(
        height: 220,
        decoration: BoxDecoration(
            image:
                DecorationImage(image: AssetImage(imgPath), fit: BoxFit.cover),
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.4),
                  offset: Offset(0, 5),
                  blurRadius: 5.0),
            ]),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: LinearGradient(colors: [
                Colors.black.withOpacity(.8),
                Colors.black.withOpacity(0.3),
              ], begin: Alignment.bottomRight)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 12.0, top: 15),
                child: Text(
                  date,
                  style: TextStyle(
                      color: Colors.white, fontSize: 15, fontFamily: 'Raleway'),
                ),
              ),
              Container(
                child: Row(
                  children: [
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 12.0, bottom: 15, top: 10),
                          child: Text('ARE WE READY FOR LAUNCH?',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontFamily: 'Raleway',
                                  fontWeight: FontWeight.w600)),
                        ),
                        Container(
                          width: 250,
                          child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 1.0, bottom: 20, top: 10),
                              child: Text(
                                  'If you\'ve been following along, you probably heard our announcement that VALORANT...  ',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontFamily: 'Raleway'))),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                            color: Color(0xFFFF4554),
                            borderRadius: BorderRadius.circular(50)),
                        child: Icon(Icons.play_arrow, color: Color(0xFFF3F3F3)),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
