import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:touchable/touchable.dart';
import 'package:website/common/utils.dart';
import 'package:website/data/network_cases_state.dart';
import 'package:website/screen/widget/painter.dart';
import 'package:website/style/style.dart';
import 'dart:math' as math;


class MobMainMap extends StatefulWidget {
  @override
  _MainMapsState createState() => _MainMapsState();
}

class _MainMapsState extends State<MobMainMap> with TickerProviderStateMixin {
  Map casesByDate = {};
  Map deathByDate = {};
  @override
  void initState() { 
    super.initState();
     Future.delayed(const Duration(milliseconds: 500), () async {

      casesByDate = await getCasesByState();
      deathByDate = await getDeathByState();

      Map data = {
        "cases": casesByDate,
        "death": deathByDate
      };

      ReportFormData.data = data;
      setState(() {});
    });
  }
  var maps = ["SS", "SM"];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: SafeArea(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                child: Center(
                  child: TabBar(
                    labelColor: Colors.black,
                     unselectedLabelColor: Colors.grey[400],
                     indicatorColor: Colors.red,
                    labelStyle: cmFont(14,color: Colors.black),
                    tabs: [
                      Tab(
                        text: ("Peninsular"),
                      ),
                      Tab(
                        text: ("Sabah & Sarawak"),
                      ),
                    ],
                  ),
                ),
              ),
              AnimatedSwitcher(
                switchInCurve: Curves.ease,
                duration: Duration(milliseconds: 500),
                child: casesByDate.isNotEmpty
                    ? Container(
                          height: 300,
                        child: TabBarView(children: [
                          Container(
                            // height: 500,
                   
                            child: Transform.scale(
                              alignment: FractionalOffset.topCenter,
                              scale: 1,
                              child: Container(
                                child: CanvasTouchDetector(
                                  builder: (context) {
                                    return CustomPaint(
                                      size: Size(
                                          Get.width * 0.5,
                                          (Get.width * 1.3769633507853403)
                                              .toDouble()),
                                      painter: MyPainter(context, "0"),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ),
                         Transform.scale(
                              alignment: FractionalOffset.topCenter,
                              scale: 1,
                              child: Padding(
                                padding: const EdgeInsets.all(22.0),
                                child: Container(
                                  child: CanvasTouchDetector(
                                    builder: (context) {
                                      return CustomPaint(
                                        size: Size(
                                            Get.width * 0.5,
                                            (Get.width * 1.3769633507853403)
                                                .toDouble()),
                                        painter: MyPainter(context, "1"),
                                      );
                                    },
                                  ),
                                ),
                              ),
                                                     ),
                           
                        ]),
                      )
                    : CircularProgressIndicator(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
