import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:website/data/network_cases_state.dart';
import 'package:website/screen/phone/mob_main_map.dart';
import 'package:website/screen/web/general_table.dart';
import 'package:website/screen/web/web_main_map.dart';
import 'package:website/screen/widget/charts/main_data_chart.dart';
import 'package:website/style/style.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var totalNewCases = "";
  var latestDate = "";
  List<dynamic> date = [];
  String _formattedDate = "";

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
    var data = {};
    await getCasesByState().then((value) {
      data = value;
      data.forEach((key, value) {
        date.add(key);
      });

      latestDate = date.last;
      _formattedDate = DateFormat('dd MMM').format(DateTime.parse(latestDate));
      Map latestData = data[latestDate];
      var _value = 0;
      latestData.forEach((key, value) {
        var val = int.parse(value);
        _value = _value + val;
        // _value = value + val;
      });
      setState(() {
        totalNewCases = _value.toString();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget mobileMap() {
      return Center(
        child:
            Container(width: Adaptive.w(90), child: MobMainMap()),
      );
    }

    Widget webMap() {
      return Center(
          child: Container(width: Adaptive.w(50), child: WebMainMap()));
    }

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
                            Get.width > 500 ? 60 : 30,
                            color: Colors.black,
                          ).copyWith(letterSpacing: -3),
                        ),
                      ),
                    ),
                    Center(
                        child: Text(
                      "Data Source: MOH GitHub",
                      style: cmFont(Get.width > 500 ? 16 : 12,
                          color: Colors.red, adapt: false),
                    )),
                    SizedBox(
                      height: 30,
                    ),
                    Center(
                      child: Container(
                          width: device == DeviceScreenType.mobile
                              ? Get.width * 0.8
                              : Get.width * 0.5,
                          child: Divider()),
                    ),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 22.0),
                            child: Center(
                              child: Container(
                                  width: device == DeviceScreenType.mobile
                                      ? Get.width * 0.8
                                      : Get.width * 0.5,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            "New reported cases as of $_formattedDate:  ",
                                            style: gmFont(
                                              Get.width > 600 ? 20 : 14,
                                              color: Colors.black,
                                            ).copyWith(letterSpacing: -1),
                                          ),
                                          Text(
                                            "$totalNewCases ",
                                            style: gmFont(
                                              Get.width > 500 ? 20 : 14,
                                              color: Colors.red,
                                            ).copyWith(letterSpacing: -1),
                                          ),
                                        ],
                                      ),
                                      Text(
                                        "There might be a slight delay in chart data as MOH sometimes did not update overall Malaysia data",
                                        maxLines: 2,
                                        style: cnFont(
                                          Get.width > 500 ? 10 : 14,
                                          color: Colors.grey,
                                        ).copyWith(letterSpacing: 0),
                                      ),
                                    ],
                                  )),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 22.0),
                            child: Center(
                              child: Container(
                                  height: 400,
                                  width: device == DeviceScreenType.mobile
                                      ? Get.width * 0.8
                                      : Get.width * 0.5,
                                  child: MainDataChart()),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Center(
                      child: Container(
                          width: device == DeviceScreenType.mobile
                              ? Get.width * 0.8
                              : Get.width * 0.5,
                          child: Divider()),
                    ),
                    device == DeviceScreenType.mobile ? mobileMap() : webMap(),
                    Center(
                      child: Container(
                          width: device == DeviceScreenType.mobile
                              ? Get.width * 0.8
                              : Get.width * 0.5,
                          child: Divider()),
                    ),
                    device == DeviceScreenType.mobile
                        ?  Center(child: Container(width: Adaptive.w(90), child: GeneralTable(device)))
                        : Center(child: Container(width: Adaptive.w(50), child: GeneralTable(device)))
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
