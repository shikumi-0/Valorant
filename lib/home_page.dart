import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'news_page.dart';
import 'package:valorant/pages/maps_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 40, 20, 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Discover',
                          style: TextStyle(
                              color: Color(0xFF1c252e),
                              fontSize: 40,
                              fontWeight: FontWeight.w900),
                        ),
                        Icon(
                          Icons.search,
                          color: Color(0xFF1c252e),
                          size: 40,
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  child: DefaultTabController(
                    length: 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: TabBar(
                              indicatorSize: TabBarIndicatorSize.label,
                              indicatorWeight: 10.0,
                              labelColor: Color(0xFFFF4554),
                              isScrollable: true,
                              unselectedLabelColor: Color(0xFF1c252e),
                              indicator: UnderlineTabIndicator(
                                  borderSide: BorderSide(
                                    width: 6,
                                    color: Color(0xFFFF4554),
                                  ),
                                  insets: EdgeInsets.only(
                                      right: 15, top: 8, bottom: 8)),
                              tabs: [
                                Tab(
                                  child: Center(
                                      child: Text(
                                    'News',
                                    style: TextStyle(
                                        fontFamily: 'Raleway',
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  )),
                                ),
                                Tab(
                                  child: Center(
                                      child: Text(
                                    'Maps',
                                    style: TextStyle(
                                        fontFamily: 'Raleway',
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  )),
                                ),
                                Tab(
                                  child: Center(
                                      child: Text(
                                    'Agents',
                                    style: TextStyle(
                                        fontFamily: 'Raleway',
                                        fontWeight: FontWeight.w900,
                                        fontSize: 20),
                                  )),
                                ),
                              ]),
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height - 100,
                          child: TabBarView(children: [
                            NewsPage(),
                            MapPage(),
                            NewsPage(),
                          ]),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
