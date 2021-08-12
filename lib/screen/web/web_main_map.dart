import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:touchable/touchable.dart';
import 'package:website/common/utils.dart';
import 'package:website/data/network_cases_state.dart';
import 'package:website/screen/widget/painter.dart';
import 'package:website/style/style.dart';

class WebMainMap extends StatefulWidget {
  @override
  _MainMapsState createState() => _MainMapsState();
}

class _MainMapsState extends State<WebMainMap> with TickerProviderStateMixin {
  var maps = ["SS", "SM"];
  Map casesByDate = {};
  Map deathByDate = {};

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
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

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: SafeArea(
        child: Container(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Container(
                  
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
              ),
              Container(
                height: Get.height * 0.5,
                child: AnimatedSwitcher(
                  switchInCurve: Curves.ease,
                  duration: Duration(milliseconds: 500),
                  child: casesByDate.isNotEmpty
                      ? Container(
                        width: Get.width > 1000 ? Get.width * 0.3 : Get.width * 0.5,
                            child: TabBarView(children: [
                              Transform.scale(
                                alignment: FractionalOffset.topCenter,
                                scale: 1,
                                child: Container(
                                  child: CanvasTouchDetector(
                                    builder: (context) {
                                      return CustomPaint(
                                        size: Size(
                                            Get.width * 0.3,
                                            (Get.width * 1.3769633507853403)
                                                .toDouble()),
                                        painter: MyPainter(context, "0"),
                                      );
                                    },
                                  ),
                                ),
                              ),
                             Transform.scale(
                                alignment: FractionalOffset.topCenter,
                                scale: 1,
                                child: Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Container(
                                    child: CanvasTouchDetector(
                                      builder: (context) {
                                        return CustomPaint(
                                          size: Size(
                                              Get.width * 0.3,
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
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
