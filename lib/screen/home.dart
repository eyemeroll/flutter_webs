import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:website/screen/phone/mob_main_map.dart';
import 'package:website/screen/web/web_main_map.dart';
import 'package:website/style/style.dart';
import 'package:responsive_sizer/responsive_sizer.dart';


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    Widget mobileMap() {
      return Center(
        child: Container(
            width: Adaptive.w(90),
            height: 1000,
            child: MobMainMap()),
      );
    }

    Widget webMap() {
      return Center(child: Container(
         width: Adaptive.w(50), child: WebMainMap()));
    }
    
  DateTime yesterday = DateTime.now().subtract(Duration(days: 1));
  String formattedDate = DateFormat('dd MMM yyyy ').format(yesterday);

    return Scaffold(
      backgroundColor: Colors.white,
      body: ResponsiveBuilder(
        builder: (context, sizingInformation) {
          var device = sizingInformation.deviceScreenType;

          return SingleChildScrollView(
            child: Center(
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: double.infinity,
                      color: Colors.black,
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Center(
                          child: Text(
                            "",
                            style:
                                cmFont(33, color: Colors.white, adapt: false),
                          ),
                        ),
                      ),
                    ),

                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 22.0),
                      child: Center(
                        child: Text(
                          "Coronavirus in the Malaysia\n Latest Map and Case Count",
                          textAlign: TextAlign.center,
                          style: gmFont(
                            Get.width > 500 ? 40 : 30,
                            color: Colors.black,
                          ).copyWith(letterSpacing: -3),
                        ),
                      ),
                    ),
                    Center(
                        child: Text(
                      "Updated $formattedDate",
                      style: cmFont(Get.width > 500 ? 16 : 12,
                          color: Colors.red, adapt: false),
                    )),
                    device == DeviceScreenType.mobile ? mobileMap() : webMap()
                    // Container(
                    //   height: 500,
                    //   width: 500,
                    //   child: RecentsPage(),)
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
