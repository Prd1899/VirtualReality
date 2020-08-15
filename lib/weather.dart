import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Weather extends StatefulWidget {
  @override
  _WeatherState createState() => _WeatherState();
}

class _WeatherState extends State<Weather> {
  ScrollController _controller;

  bool show = false;

  _scrollListener() {
    if (_controller.offset >= _controller.position.maxScrollExtent &&
        !_controller.position.outOfRange) {
      setState(() {
        show = true;
      });
    }
    if (_controller.offset <= _controller.position.minScrollExtent &&
        !_controller.position.outOfRange) {
      setState(() {
        show = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();

    _controller = ScrollController();
    _controller.addListener(_scrollListener);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: show == false
                ? AssetImage(
                    'assets/cloudy.jpg',
                  )
                : AssetImage(
                    'assets/night.jpg',
                  ),
            fit: BoxFit.fill,
          ),
        ),
        child: Column(
          children: [
            Expanded(
                flex: 2,
                child: show == false
                    ? Column(
                        children: [
                          SizedBox(height: 50),
                          Icon(
                            Icons.cloud,
                            size: 130,
                            color: Colors.white,
                          ),
                          Text(
                            '25°C',
                            style: TextStyle(fontSize: 50, color: Colors.white),
                          )
                        ],
                      )
                    : Column(
                        children: [
                          SizedBox(height: 50),
                          FaIcon(
                            FontAwesomeIcons.solidMoon,
                            size: 110,
                            color: Colors.white,
                          ),
                          Text(
                            '18°C',
                            style: TextStyle(fontSize: 50, color: Colors.white),
                          )
                        ],
                      )),
            Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: SingleChildScrollView(
                    controller: _controller,
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: BlurryContainer(

                              height: 200,
                              width: MediaQuery.of(context).size.width / 1.2,
                              borderRadius: BorderRadius.circular(30),
                              blur: 15,
                              bgColor: Colors.white10,
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.only(left: .0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Column(
                                            children: [
                                              Text(
                                                '25°',
                                                style: TextStyle(
                                                  color: Color(0xFFFFFFFF),
                                                  fontSize: 30, //40,
                                                  fontWeight: FontWeight.w900,
                                                ),
                                              ),
                                              Text(
                                                'Today',
                                                style: TextStyle(
                                                  color: Color(0xFFFFFFFF),
                                                  fontSize: 15, //40,
                                                  fontWeight: FontWeight.w300,
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(width: 20),
                                          Text(
                                            '|',
                                            style: TextStyle(
                                              color: Color(0xFFFFFFFF),
                                              fontSize: 55, //40,
                                              fontWeight: FontWeight.w100,
                                            ),
                                          ),
                                          SizedBox(width: 20),
                                          Column(
                                            children: [
                                              Text(
                                                'Mumbai',
                                                style: TextStyle(
                                                  color: Color(0xFFFFFFFF),
                                                  fontSize: 30, //40,
                                                  fontWeight: FontWeight.w900,
                                                ),
                                              ),
                                              Text(
                                                'India',
                                                style: TextStyle(
                                                  color: Color(0xFFFFFFFF),
                                                  fontSize: 15, //40,
                                                  fontWeight: FontWeight.w300,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 30),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              'Wind   |',
                                              style: TextStyle(
                                                color: Color(0xFFFFFFFF),
                                                fontSize: 15, //40,
                                                fontWeight: FontWeight.w300,
                                              ),
                                            ),
                                            Text(
                                              ' 10 km/h',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 15, //40,
                                                fontWeight: FontWeight.w900,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              'Humidity   |',
                                              style: TextStyle(
                                                color: Color(0xFFFFFFFF),
                                                fontSize: 15, //40,
                                                fontWeight: FontWeight.w300,
                                              ),
                                            ),
                                            Text(
                                              ' 54%',
                                              style: TextStyle(
                                                color: Color(0xFFFFFFFF),
                                                fontSize: 15, //40,
                                                fontWeight: FontWeight.w900,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    )
                                  ])),
                        ),
                        SizedBox(width: 20),
                        Padding(
                          padding: const EdgeInsets.only(right: 20.0),
                          child: BlurryContainer(

                              height: 200,
                              width: MediaQuery.of(context).size.width / 1.2,
                              borderRadius: BorderRadius.circular(30),
                              blur: 5,
                              bgColor: Colors.white10,
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.only(left: .0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Column(
                                            children: [
                                              Text(
                                                '18°',
                                                style: TextStyle(
                                                  color: Color(0xFFFFFFFF),
                                                  fontSize: 30, 
                                                  fontWeight: FontWeight.w900,
                                                ),
                                              ),
                                              Text(
                                                'Tomorrow',
                                                style: TextStyle(
                                                  color: Color(0xFFFFFFFF),
                                                  fontSize: 15, 
                                                  fontWeight: FontWeight.w300,
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(width: 20),
                                          Text(
                                            '|',
                                            style: TextStyle(
                                              color: Color(0xFFFFFFFF),
                                              fontSize: 55, //40,
                                              fontWeight: FontWeight.w100,
                                            ),
                                          ),
                                          SizedBox(width: 20),
                                          Column(
                                            children: [
                                              Text(
                                                'Mumbai',
                                                style: TextStyle(
                                                  color: Color(0xFFFFFFFF),
                                                  fontSize: 30, //40,
                                                  fontWeight: FontWeight.w900,
                                                ),
                                              ),
                                              Text(
                                                'India',
                                                style: TextStyle(
                                                  color: Color(0xFFFFFFFF),
                                                  fontSize: 15, //40,
                                                  fontWeight: FontWeight.w300,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 30),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              'Wind   |',
                                              style: TextStyle(
                                                color: Color(0xFFFFFFFF),
                                                fontSize: 15, 
                                                fontWeight: FontWeight.w300,
                                              ),
                                            ),
                                            Text(
                                              ' 15 km/h',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 15, 
                                                fontWeight: FontWeight.w900,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              'Humidity   |',
                                              style: TextStyle(
                                                color: Color(0xFFFFFFFF),
                                                fontSize: 15,
                                                fontWeight: FontWeight.w300,
                                              ),
                                            ),
                                            Text(
                                              ' 30%',
                                              style: TextStyle(
                                                color: Color(0xFFFFFFFF),
                                                fontSize: 15, 
                                                fontWeight: FontWeight.w900,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    )
                                  ])),
                        ),
                      ],
                    ),
                  ),
                ))
          ],
        ),
      ),
    ));
  }
}
