import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white24,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 55,
              width: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.black,
              ),
              child: Stack(
                children: <Widget>[
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        _currentIndex == 0
                            ? Column(
                                children: <Widget>[
                                  Container(
                                    height: 3,
                                    width: 40,
                                    decoration:
                                        BoxDecoration(color: Colors.white),
                                  ),
                                  Transform.rotate(
                                    angle: pi,
                                    child: ClipPath(
                                      child: Container(
                                        decoration: BoxDecoration(
//                                  color: Colors.transparent,
                                          gradient: LinearGradient(
                                            colors: [
                                              Colors.white.withOpacity(0.4),
                                              Colors.white.withOpacity(0.2),
                                              Colors.transparent
                                            ],
                                            begin: Alignment.bottomCenter,
                                            end: Alignment.topCenter,
                                          ),
                                        ),
                                        height: 50,
                                        width: 70,
                                      ),
                                      clipper: TriangleClipper(),
                                    ),
                                  )
                                ],
                              )
                            : Container(
                                height: 3,
                                width: 40,
                              ),
                        _currentIndex == 1
                            ? Column(
                                children: <Widget>[
                                  Container(
                                    height: 3,
                                    width: 40,
                                    decoration:
                                        BoxDecoration(color: Colors.white),
                                  ),
                                  Transform.rotate(
                                    angle: pi,
                                    child: ClipPath(
                                      child: Container(
                                        decoration: BoxDecoration(
//                                  color: Colors.transparent,
                                          gradient: LinearGradient(
                                            colors: [
                                              Colors.white.withOpacity(0.4),
                                              Colors.white.withOpacity(0.2),
                                              Colors.transparent
                                            ],
                                            begin: Alignment.bottomCenter,
                                            end: Alignment.topCenter,
                                          ),
                                        ),
                                        height: 50,
                                        width: 70,
                                      ),
                                      clipper: TriangleClipper(),
                                    ),
                                  )
                                ],
                              )
                            : Container(
                                height: 3,
                                width: 40,
                              ),
                        _currentIndex == 2
                            ? Column(
                                children: <Widget>[
                                  Container(
                                    height: 3,
                                    width: 40,
                                    decoration:
                                        BoxDecoration(color: Colors.white),
                                  ),
                                  Transform.rotate(
                                    angle: pi,
                                    child: ClipPath(
                                      child: Container(
                                        decoration: BoxDecoration(
//                                  color: Colors.transparent,
                                          gradient: LinearGradient(
                                            colors: [
                                              Colors.white.withOpacity(0.4),
                                              Colors.white.withOpacity(0.2),
                                              Colors.transparent
                                            ],
                                            begin: Alignment.bottomCenter,
                                            end: Alignment.topCenter,
                                          ),
                                        ),
                                        height: 50,
                                        width: 70,
                                      ),
                                      clipper: TriangleClipper(),
                                    ),
                                  )
                                ],
                              )
                            : Container(
                                height: 3,
                                width: 40,
                              ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(
                          width: 10,
                        ),
                        GestureDetector(
                          child: Container(
                            width: 50,
                            child: Icon(
                              Icons.home,
                              color: _currentIndex == 0
                                  ? Colors.white
                                  : Colors.white54,
                            ),
                          ),
                          onTap: () {
                            updateSelectedIndex(0);
                          },
                        ),
                        Expanded(
                          child: Container(),
                        ),
                        GestureDetector(
                          child: Container(
                            width: 50,
                            child: Icon(
                              Icons.person,
                              color: _currentIndex == 1
                                  ? Colors.white
                                  : Colors.white54,
                            ),
                          ),
                          onTap: () {
                            updateSelectedIndex(1);
                          },
                        ),
                        Expanded(
                          child: Container(),
                        ),
                        GestureDetector(
                          child: Container(
                            width: 50,
                            child: Icon(
                              Icons.settings,
                              color: _currentIndex == 2
                                  ? Colors.white
                                  : Colors.white54,
                            ),
                          ),
                          onTap: () {
                            updateSelectedIndex(2);
                          },
                        ),
                        SizedBox(
                          width: 10,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  getLeftPositioning(int index) {
    switch (index) {
      case 0:
        return 48.0;
      case 1:
        return 10.0;
      case 2:
        return 0.0;
    }
  }

  getRightPositioning(int index) {
    switch (index) {
      case 0:
        return 0.0;
      case 1:
        return 10.0;
      case 2:
        return 48.0;
    }
  }

  updateSelectedIndex(int i) {
    setState(() {
      _currentIndex = i;
    });
  }
}

class TriangleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
//    path.lineTo(size.width, 0.0);
    path.lineTo(size.width * 0.25, size.height);
    path.lineTo(size.width * 0.75, size.height);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(TriangleClipper oldClipper) => false;
}
