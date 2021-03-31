import 'dart:ui';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:visibility_detector/visibility_detector.dart';
import 'package:website/common/colors.dart';
import 'package:website/common/style.dart';
import 'package:website/screen/company/company.dart';
import 'package:website/screen/homepage/homepage.dart';
import 'package:website/screen/widget/main_menu.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var _tabList;
  var _data;
  var _currentHome;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _data = {};
    _tabList = {
      "main": {
        "section": "Main",
        "label": "Main",
        "active": false,
        "route": Homepage(
            data: _data["homepage"],
            onChanged: (value) {
              setState(() {
                _data["homepage"] = value;
              });
            }),
      },
      "company": {
        "section": "Company",
        "label": "Company",
        "active": false,
        "route": Company(
            data: _data["company"],
            onChanged: (value) {
              setState(() {
                _data["company"] = value;
              });
            }),
      },
    };
  }

  void onTitleClicked(obj) {
    FocusScope.of(context).unfocus();
    setState(() {
      _currentHome = obj["route"];
    });
  }

  var _visibility = 0.0;
  var _visiblePercentage = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            MainMenu(),
            Container(
              height: MediaQuery.of(context).size.height - 60,
              child: PageView(
                children: <Widget>[
                  Container(
                    color: Colors.white54,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(width: 3, color: Colors.black)),
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Row(
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 50.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "ABC lets create",
                                        style: lightLogoFont().copyWith(
                                          color: Colors.grey[400],
                                          fontSize: 30,
                                        ),
                                      ),
                                      TypewriterAnimatedTextKit(
                                        speed: Duration(milliseconds: 100),
                                        onTap: () {
                                          print("Tap Event");
                                        },
                                        text: [
                                          "Website",
                                          "Web Apps",
                                          "Mobile Apps",
                                        ],
                                        textStyle: standardFont().copyWith(
                                            fontSize: 80,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold),
                                        textAlign: TextAlign.start,
                                      ),
                                      RichText(
                                        text: TextSpan(
                                          text: "Let's create the future, ",
                                          style: lightLogoFont().copyWith(
                                              color: Colors.white,
                                              height: 2,
                                              backgroundColor: Colors.black,
                                              fontSize: 20),
                                          children: <TextSpan>[
                                            TextSpan(
                                                text: ' together.',
                                                style: boldLogoFont().copyWith(
                                                    color: Colors.white,
                                                    fontSize: 20))
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  color: Colors.black,
                                  width:
                                      MediaQuery.of(context).size.width * 0.9,
                                  child: Stack(
                                    children: [
                                      Positioned(
                                        top: 50,
                                        left: 50,
                                        child: Align(
                                          alignment: Alignment.topLeft,
                                          child: Container(
                                              height: 250,
                                              width: 250,
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  gradient: LinearGradient(
                                                      begin:
                                                          Alignment.centerLeft,
                                                      end:
                                                          Alignment.centerRight,
                                                      colors: [
                                                        Color(0xFFee9ca7),
                                                        Color(0xFFffdde1),
                                                      ]))),
                                        ),
                                      ),
                                      Positioned(
                                        bottom: 50,
                                        right: 50,
                                        child: Align(
                                          alignment: Alignment.center,
                                          child: Container(
                                              height: 250,
                                              width: 250,
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  gradient: LinearGradient(
                                                      begin:
                                                          Alignment.centerLeft,
                                                      end:
                                                          Alignment.centerRight,
                                                      colors: [
                                                        Color(0xFFee9ca7),
                                                        Color(0xFFffdde1),
                                                      ]))),
                                        ),
                                      ),
                                      Center(
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10)),
                                          child: Container(
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: Colors.white30)),
                                            child: BackdropFilter(
                                              filter: ImageFilter.blur(
                                                sigmaX: 10.0,
                                                sigmaY: 10.0,
                                              ),
                                              child: Container(
                                                width: 300,
                                                height: 200,
                                                alignment: Alignment.center,
                                                child: Padding(
                                                  padding: const EdgeInsets.all(
                                                      15.0),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Row(
                                                        children: [
                                                          Text("ABC",
                                                              style: boldLogoFont()
                                                                  .copyWith(
                                                                      color: Colors
                                                                          .white)),
                                                          Text("Studio",
                                                              style: lightLogoFont()
                                                                  .copyWith(
                                                                      color: Colors
                                                                          .white))
                                                        ],
                                                      ),
                                                      SizedBox(height: 50,),
                                                      Text("Ahmad Muhammad", style: standardFont(color: Colors.white).copyWith(fontSize: 25),),
                                                        Text("Programmer", style: standardFont(color: Colors.white).copyWith(fontSize: 14, fontWeight: FontWeight.w100),)
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    color: Colors.cyan,
                  ),
                  Container(
                    color: Colors.deepPurple,
                  ),
                ],
              ),
            ),
            Container(
                height: 500,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    FlutterLogo(),
                    Center(
                      child: ClipRect(
                        child: BackdropFilter(
                          filter: ImageFilter.blur(
                            sigmaX: 10.0,
                            sigmaY: 10.0,
                          ),
                          child: Container(
                            width: 200,
                            height: 200,
                            alignment: Alignment.center,
                            child: Text('Hi Frost'),
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
            Container(
              height: 500,
              color: Colors.white54,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30.0, vertical: 30),
                child: AnimatedOpacity(
                  duration: Duration(milliseconds: 500),
                  opacity: _visibility > 0.8
                      ? 1
                      : _visibility > 0.6
                          ? 0.8
                          : 0.2,
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey,
                              spreadRadius: 0.2,
                              blurRadius: 5,
                              offset: Offset(0, 0))
                        ],
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: VisibilityDetector(
                      key: Key('my-widget-key'),
                      onVisibilityChanged: (visibilityInfo) {
                        _visiblePercentage =
                            visibilityInfo.visibleFraction * 100;

                        setState(() {
                          _visibility = _visiblePercentage / 100;
                        });
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "It's here!",
                            style: standardFont().copyWith(fontSize: 90),
                          ),
                          Text(
                            "@ABC",
                            style: standardFont().copyWith(
                                fontSize: 20, backgroundColor: Colors.yellow),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            // Container(
            //   height: 500,
            //   color: Colors.yellow,
            //   child: Padding(
            //     padding:
            //         const EdgeInsets.symmetric(horizontal: 30.0, vertical: 30),
            //     child: AnimatedOpacity(
            //       duration: Duration(milliseconds: 500),
            //       opacity: _visibility > 0.8
            //           ? 1
            //           : _visibility > 0.6
            //               ? 0.8
            //               : 0.2,
            //       child: Container(
            //         width: MediaQuery.of(context).size.width * 0.9,
            //         decoration: BoxDecoration(
            //             color: Colors.white,
            //             boxShadow: [
            //               BoxShadow(
            //                   color: Colors.grey,
            //                   spreadRadius: 0.2,
            //                   blurRadius: 5,
            //                   offset: Offset(0, 0))
            //             ],
            //             borderRadius: BorderRadius.all(Radius.circular(10))),
            //         child: VisibilityDetector(
            //           key: Key('my-widget-keys'),
            //           onVisibilityChanged: (visibilityInfo) {
            //             _visiblePercentage =
            //                 visibilityInfo.visibleFraction * 100;

            //             setState(() {
            //               _visibility = _visiblePercentage / 100;
            //             });
            //           },
            //           child: Column(
            //             crossAxisAlignment: CrossAxisAlignment.center,
            //             mainAxisAlignment: MainAxisAlignment.center,
            //             children: [
            //               Text(
            //                 "It's here!",
            //                 style: standardFont().copyWith(fontSize: 90),
            //               ),
            //               Text(
            //                 "@eyemeroll",
            //                 style: standardFont().copyWith(
            //                     fontSize: 20, backgroundColor: Colors.yellow),
            //               )
            //             ],
            //           ),
            //         ),
            //       ),
            //     ),
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
