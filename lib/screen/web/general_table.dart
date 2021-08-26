
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:stats/stats.dart';
import 'package:website/data/network_cases_state.dart';

import 'package:website/style/style.dart';

class GeneralTable extends StatefulWidget {
  final DeviceScreenType device;
  GeneralTable(this.device);

  @override
  _GeneralTableState createState() => _GeneralTableState();
}

class _GeneralTableState extends State<GeneralTable> {
  Map data = {};
  Map cases = {};
  Map currentCases = {};
  String lastKey = "";
  Map twoWeeksCases = {};

  //Vaccination data
  Map popData = {};
  Map vaccinationData = {};
  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
    await getIcuCasesByDate().then((value) {
      setState(() {
        data = value;
        var lastItem = data.length;
        lastKey = data.keys.elementAt(lastItem - 1);
      });
    });

    await getCasesByState().then((value) {
      setState(() {
        cases = value;

        // var latestDate = DateFormat('yyyy-MM-dd').format(DateTime.parse(lastKey));
        var lastDateAvailable = DateTime.parse(lastKey);
        for (int i = 0; i < 14; i++) {
          var yesterday = lastDateAvailable.subtract(Duration(days: i));
          String date = DateFormat('yyyy-MM-dd').format(yesterday);

          Map dataToLoop = cases[date];

          dataToLoop.forEach((key, value) {
            if (twoWeeksCases.containsKey(key)) {
              List data = twoWeeksCases[key];
              data.add(value);
            } else {
              twoWeeksCases.putIfAbsent(key, () => [value]);
            }
          });
        }
        currentCases = cases[lastKey];
      });
    });

    await getMalaysiaPop().then((value) => {
          setState(() {
            popData = value;
          })
        });

    await getVaccineByStateDate().then((value) => {
          setState(() {
            vaccinationData = value;
          })
        });
  }

  @override
  Widget build(BuildContext context) {

  var eighteenFont = widget.device == DeviceScreenType.mobile ? 14 : 18;
  //var tenFont =  widget.device == DeviceScreenType.mobile ? 10 : 8;
    
    Widget tableData() {
      List<Widget> widList = [];

      if (lastKey.isNotEmpty) {
        Map latestData = data[lastKey];
        var y = 0;
      
        latestData.forEach((key, value) {
          y++;
          var x = twoWeeksCases[key];
          List<int> newData = [];
          if (x != null) {
            var _xdata = List.from(twoWeeksCases[key]);
            _xdata.forEach((element) {
              try {
                var m = int.parse(element);
                newData.add(m);
              } catch (e) {
                print(e);
              }
            });
          }

          var latestIcuCovid = latestData[key];

          var bedIcuTotal = int.parse(latestIcuCovid["bed_icu_total"]);
          var bedIcuCovidUsage = int.parse(latestIcuCovid["icu_covid"]);
          var bedIcuCovidPercentage = (bedIcuCovidUsage / bedIcuTotal) * 100;

          var bedIcuNonCovidUsage = int.parse(latestIcuCovid["icu_noncovid"]);
          var bedIcuPUIUsage = int.parse(latestIcuCovid["icu_pui"]);
          var totalNonCovidIcu = bedIcuNonCovidUsage + bedIcuPUIUsage;
          var bedIcuNonCovidPercentage = (totalNonCovidIcu / bedIcuTotal) * 100;

          var avg = "";
          if (newData.isNotEmpty) {
            var stats = Stats.fromData(newData);
            avg = stats.average.toStringAsFixed(0);
          }

          var vaxxData = vaccinationData[lastKey];

          int fullyVaxx = 0;
          
          if (vaxxData != null) {
            var y = vaxxData[key];
            fullyVaxx = int.parse(y["doseTwoCumulative"]);
          }

         

          var totPop = 0;
          var getPop = popData[key];
          var percentFullyVax = 0.0;
          if (getPop != null) {
            totPop = int.parse(getPop["pop"]);
          }

        
          percentFullyVax = fullyVaxx / totPop * 100;

          widList.add(
            Padding(
              padding: const EdgeInsets.all(0.0),
              child: Container(
                color: Colors.grey[200]!.withOpacity(0.4),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16.0, vertical: 0),
                  child: Column(
                    children: [
                      y == 1 ? Container(height: 8) : Container(),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 4.0, top: 4),
                        child: Row(
                          children: [
                            Expanded(
                                child: Container(
                                    child: Text(
                              key.toString(),
                              style: cnFont(eighteenFont, adapt: false),
                            ))),
                            Expanded(
                                child: Text(
                              avg,
                              textAlign: TextAlign.end,
                              style: cnFont(eighteenFont, adapt: false),
                            )),
                            Expanded(
                                child: Text(
                              bedIcuTotal.toString(),
                              textAlign: TextAlign.end,
                              style: cnFont(eighteenFont, adapt: false),
                            )),
                              widget.device == DeviceScreenType.mobile ? Container() : Expanded(
                                child: Text(
                              bedIcuCovidUsage.toString(),
                              textAlign: TextAlign.end,
                              style: cnFont(eighteenFont, adapt: false),
                            )),
                            Expanded(
                                child: Container(
                              child: Text(
                                "${bedIcuCovidPercentage.toStringAsFixed(0)}%",
                                textAlign: TextAlign.end,
                                style: cnFont(eighteenFont,
                                    adapt: false,
                                    color:
                                        getColorPerct(bedIcuCovidPercentage)),
                              ),
                            )),
                            widget.device == DeviceScreenType.mobile ? Container() : Expanded(
                                child: Container(
                              child: Text(
                                "${bedIcuNonCovidPercentage.toStringAsFixed(0)}%",
                                textAlign: TextAlign.end,
                                style: cnFont(eighteenFont,
                                    adapt: false,
                                    color: getColorPerct(
                                        bedIcuNonCovidPercentage)),
                              ),
                            )),
                            Expanded(
                                child: Container(
                              child: Text(
                                "${percentFullyVax.toStringAsFixed(0)}%",
                                textAlign: TextAlign.end,
                                style: cnFont(eighteenFont,
                                    adapt: false,
                                    color: getVaxColorPer(percentFullyVax)),
                              ),
                            )),
                          ],
                        ),
                      ),
                      y == latestData.length ? Container(height: 10) : Divider(
                        color: Colors.grey[300],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
      }

      return Padding(
        padding: const EdgeInsets.all(0.0),
        child: Container(
            child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  Expanded(child: Container(child: Text(""))),
                  Expanded(
                      child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text("CASES", style: cmFont(10, adapt: false)),
                        Text("14 DAY AVG", style: cnFont(9, adapt: false)),
                      ],
                    ),
                  )),
                  Expanded(
                      child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text("ICU BED", style: cmFont(10, adapt: false)),
                        Text("CAPACITY", style: cnFont(9, adapt: false)),
                      ],
                    ),
                  )),
                   widget.device == DeviceScreenType.mobile ? Container() :  Expanded(
                      child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text("ICU COVID", style: cmFont(10, adapt: false)),
                        Text("USAGE", style: cnFont(9, adapt: false)),
                      ],
                    ),
                  )),
                  Expanded(
                      child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text("ICU COVID", style: cmFont(10, adapt: false)),
                        Text("PERCENT %", style: cnFont(9, adapt: false)),
                      ],
                    ),
                  )),
                   widget.device == DeviceScreenType.mobile ? Container() : Expanded(
                      child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text("ICU NON COVID", style: cmFont(10, adapt: false)),
                        Text("PERCENT %", style: cnFont(9, adapt: false)),
                      ],
                    ),
                  )),
                  Expanded(
                      child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text("FULLY VAX", style: cmFont(10, adapt: false)),
                        Text("PERCENT %", style: cnFont(9, adapt: false)),
                      ],
                    ),
                  )),
                ],
              ),
            ),
            SizedBox(
              height: 4,
            ),
            ...widList,
          ],
        )),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Detailed stats",
          style: gmFont(
            Get.width > 600 ? 20 : 14,
            color: Colors.black,
          ).copyWith(letterSpacing: -1),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: tableData(),
        ),
       
      ],
    );
  }
}

Color getColorPerct(double percent) {
  var color = Colors.black;

  if (percent < 70) {
    color = Colors.black;
  } else if (percent > 70 && percent <= 85) {
    color = Colors.red[400]!;
  } else if (percent > 85 && percent <= 95) {
    color = Colors.red[600]!;
  } else {
    color = Colors.red[800]!;
  }
  return color;
}

Color getVaxColorPer(double percent) {
  var color = Colors.black;

  if (percent < 50) {
    color = Colors.green[200]!;
  } else if (percent > 50 && percent <= 70) {
    color = Colors.green[400]!;
  } else if (percent > 70 && percent <= 95) {
    color = Colors.green[600]!;
  } else {
    color = Colors.green[800]!;
  }
  return color;
}
