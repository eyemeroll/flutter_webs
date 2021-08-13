import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:touchable/touchable.dart';
import 'package:website/common/colors.dart';
import 'package:website/common/utils.dart';

import 'package:website/data/death_state.dart';
import 'package:website/data/population.dart';
import 'package:website/paint/johor.dart';
import 'package:website/paint/kedah.dart';
import 'package:website/paint/kelantan.dart';
import 'package:website/paint/labuan.dart';
import 'package:website/paint/melaka.dart';
import 'package:website/paint/nsembilan.dart';
import 'package:website/paint/pahang.dart';
import 'package:website/paint/penang.dart';
import 'package:website/paint/perak.dart';
import 'package:website/paint/perlis.dart';
import 'package:website/paint/sabah.dart';
import 'package:website/paint/sarawak.dart';
import 'package:website/paint/selangor.dart';
import 'package:website/paint/terengganu.dart';
import 'package:website/style/style.dart';

class MyPainter extends CustomPainter {
  String data;
  final BuildContext context;
  MyPainter(this.context, this.data);

  Color strokeColor = Colors.black;
  var _tapPosition;

  @override
  void paint(Canvas _canvas, Size size) {
    TouchyCanvas canvas = TouchyCanvas(context, _canvas);

    if (data == "0") {
      drawJohor(canvas, size);
      drawKedah(canvas, size);
      drawKelantan(canvas, size);
      drawMelaka(canvas, size);
      drawNS(canvas, size);
      drawPahang(canvas, size);
      drawPenang(canvas, size);
      drawPerak(canvas, size);
      drawPerlis(canvas, size);
      drawSelangor(canvas, size);
      drawTerengganu(canvas, size);
    } else {
      drawSabah(canvas, size);
      drawSarawak(canvas, size);
      drawLabuan(canvas, size);
    }
  }

  void drawLabuan(TouchyCanvas canvas, Size size) {
    int death = getDeathYtd("W.P. Labuan");
    int totPopulation = getTotPop("W.P. Labuan");
    int latestCases = getLatestCases("W.P. Labuan");
    Color color = getColor(latestCases);
    Path path_0 = getLabuan(size);
    void onDraw(_) {
      _storePosition(_);
      _showPopupMenu("W.P. Labuan", latestCases, totPopulation, death);
    }

    drawPaths(canvas, path_0, onDraw, color: color);
  }

  void drawSarawak(TouchyCanvas canvas, Size size) {
    int death = getDeathYtd("Sarawak");
    int totPopulation = getTotPop("Sarawak");
    int latestCases = getLatestCases("Sarawak");
    Color color = getColor(latestCases);
    Path path_0 = getSarawak(size);
    void onDraw(_) {
      _storePosition(_);
      _showPopupMenu("Sarawak", latestCases, totPopulation, death);
    }

    drawPaths(canvas, path_0, onDraw, color: color);
  }

  void drawTerengganu(TouchyCanvas canvas, Size size) {
    int death = getDeathYtd("Terengganu");
    int totPopulation = getTotPop("Terengganu");
    int latestCases = getLatestCases("Terengganu");
    Color color = getColor(latestCases);
    Path path_0 = getTerengganu(size);
    void onDraw(_) {
      _storePosition(_);
      _showPopupMenu("Terengganu", latestCases, totPopulation, death);
    }

    drawPaths(canvas, path_0, onDraw, color: color);
  }

  void drawSelangor(TouchyCanvas canvas, Size size) {
    int death = getDeathYtd("Selangor");
    int totPopulation = getTotPop("Selangor");
    int latestCases = getLatestCases("Selangor");
    Color color = getColor(latestCases);
    Path path_0 = getSelangor(size);
    void onDraw(_) {
      _storePosition(_);
      _showPopupMenu("Selangor", latestCases, totPopulation, death);
    }

    drawPaths(canvas, path_0, onDraw, color: color);
  }

  void drawPerlis(TouchyCanvas canvas, Size size) {
    int death = getDeathYtd("Perlis");
    int totPopulation = getTotPop("Perlis");
    int latestCases = getLatestCases("Perlis");
    Color color = getColor(latestCases);
    Path path_0 = getPerlis(size);
    void onDraw(_) {
      _storePosition(_);
      _showPopupMenu("Perlis", latestCases, totPopulation, death);
    }

    drawPaths(canvas, path_0, onDraw, color: color);
  }

  void drawPerak(TouchyCanvas canvas, Size size) {
    int death = getDeathYtd("Perak");
    int totPopulation = getTotPop("Perak");
    int latestCases = getLatestCases("Perak");
    Color color = getColor(latestCases);
    Path path_0 = getPerak(size);
    void onDraw(_) {
      _storePosition(_);
      _showPopupMenu("Perak", latestCases, totPopulation, death);
    }

    drawPaths(canvas, path_0, onDraw, color: color);
  }

  void drawPenang(TouchyCanvas canvas, Size size) {
    int death = getDeathYtd("Pulau Pinang");
    int totPopulation = getTotPop("Pulau Pinang");
    int latestCases = getLatestCases("Pulau Pinang");
    Color color = getColor(latestCases);
    Path path_0 = getPenang(size);

    void onDraw(_) {
      _storePosition(_);
      _showPopupMenu("Pulau Pinang", latestCases, totPopulation, death);
    }

    drawPaths(canvas, path_0, onDraw, color: color);
  }

  void drawPahang(TouchyCanvas canvas, Size size) {
    int death = getDeathYtd("Pahang");
    int totPopulation = getTotPop("Pahang");
    int latestCases = getLatestCases("Pahang");
    Color color = getColor(latestCases);
    Path path_0 = getPahang(size);
    void onDraw(_) {
      _storePosition(_);
      _showPopupMenu("Pahang", latestCases, totPopulation, death);
    }

    drawPaths(canvas, path_0, onDraw, color: color);
  }

  void drawNS(TouchyCanvas canvas, Size size) {
    int death = getDeathYtd("Negeri Sembilan");
    int totPopulation = getTotPop("Negeri Sembilan");
    int latestCases = getLatestCases("Negeri Sembilan");
    Color color = getColor(latestCases);
    Path path_0 = getNS(size);
    void onDraw(_) {
      _storePosition(_);
      _showPopupMenu("Negeri Sembilan", latestCases, totPopulation, death);
    }

    drawPaths(canvas, path_0, onDraw, color: color);
  }

  void drawMelaka(TouchyCanvas canvas, Size size) {
    int death = getDeathYtd("Melaka");
    int totPopulation = getTotPop("Melaka");
    int latestCases = getLatestCases("Melaka");
    Color color = getColor(latestCases);
    Path path_0 = getMelaka(size);
    void onDraw(_) {
      _storePosition(_);
      _showPopupMenu("Melaka", latestCases, totPopulation, death);
    }

    drawPaths(canvas, path_0, onDraw, color: color);
  }

  void drawSabah(TouchyCanvas canvas, Size size) {
    int death = getDeathYtd("Sabah");
    int totPopulation = getTotPop("Sabah");
    int latestCases = getLatestCases("Sabah");
    Color color = getColor(latestCases);
    Path path_0 = getSabah(size);
    void onDraw(_) {
      _storePosition(_);
      _showPopupMenu("Sabah", latestCases, totPopulation, death);
    }

    drawPaths(canvas, path_0, onDraw, color: color);
  }

  void drawJohor(TouchyCanvas canvas, Size size) {
    int death = getDeathYtd("Johor");
    int totPopulation = getTotPop("Johor");
    int latestCases = getLatestCases("Johor");
    Color color = getColor(latestCases);

    Path path_0 = getJohor(size);
    void onDraw(_) {
      _storePosition(_);
      _showPopupMenu("Johor", latestCases, totPopulation, death);
    }

    drawPaths(canvas, path_0, onDraw, color: color);
  }

  void drawKedah(TouchyCanvas canvas, Size size) {
    int death = getDeathYtd("Kedah");
    int totPopulation = getTotPop("Kedah");
    int latestCases = getLatestCases("Kedah");
    Color color = getColor(latestCases);
    Path path_0 = getKedah(size);
    void onDraw(_) {
      _storePosition(_);
      _showPopupMenu("Kedah", latestCases, totPopulation, death);
    }

    drawPaths(canvas, path_0, onDraw, color: color);
  }

  void drawKelantan(TouchyCanvas canvas, Size size) {
    int death = getDeathYtd("Kelantan");
    int totPopulation = getTotPop("Kelantan");
    int latestCases = getLatestCases("Kelantan");
    Color color = getColor(latestCases);
    Path path_0 = getKelantan(size);
    void onDraw(_) {
      _storePosition(_);
      _showPopupMenu("Kelantan", latestCases, totPopulation, death);
    }

    drawPaths(canvas, path_0, onDraw, color: color);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }

  _showPopupMenu(String state, int cases, int pop, int death) async {
    final RenderBox overlay =
        Overlay.of(context)!.context.findRenderObject() as RenderBox;

    var x = getCasesTwoDaysBefore(state);
    var getDifference = cases - x;

    var y = getDeathTwoDaysBefore(state);
    var deathDifference = death - y;

    DateTime today = DateTime.now();
    DateTime yesterday = DateTime.now().subtract(Duration(days: 1));
    String todayFormatted = DateFormat('yyyy-MM-dd').format(today);
    String _formattedDate = DateFormat('dd MMM').format(yesterday);
    String _todayFormatted = DateFormat('dd MMM').format(today);
    String latestDate = "";
  
    var data = ReportFormData.data['cases'];

    try {
      var lastestData = data[todayFormatted];
      if (lastestData != null) latestDate = _todayFormatted;
      else latestDate = _formattedDate;
    } catch (e) {
      
    }

    print(latestDate);

    await showMenu(
      context: context,
      position: RelativeRect.fromRect(
          _tapPosition & Size(40, 40), // smaller rect, the touch area
          Offset.zero & overlay.size // Bigger rect, the entire screen
          ),
      items: [
        PopupMenuItem(
            child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(state, style: cbFont(14, adapt: false)),
                  SizedBox(
                    width: 8,
                  ),
                  Text("${latestDate.toUpperCase()}",
                      style: cbFont(11, adapt: false)),
                ],
              ),
              SizedBox(height: 6),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("CASES ", style: cnFont(11, adapt: false)),
                  Text("DEATH", style: cnFont(11, adapt: false)),
                ],
              ),
              Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(cases.toString(), style: cnFont(25, adapt: false)),
                      SizedBox(
                        width: 8,
                      ),
                      getDifference == 0
                          ? Container()
                          : getDifference.isNegative
                              ? Icon(Icons.arrow_downward, size: 18)
                              : Icon(Icons.arrow_upward, size: 18),
                      Text("(${getDifference.toString()})",
                          style: cnFont(14, adapt: false)),
                    ],
                  ),
                  SizedBox(width: 10,),
                  Row(
                    children: [
                      Text(death.toString(), style: cnFont(25, adapt: false)),
                      SizedBox(
                        width: 8,
                      ),
                      deathDifference == 0
                          ? Container()
                          : deathDifference.isNegative
                              ? Icon(Icons.arrow_downward, size: 18)
                              : Icon(Icons.arrow_upward, size: 18),
                      Text("(${deathDifference.toString()})",
                          style: cnFont(14, adapt: false)),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ))
      ],
      elevation: 8.0,
    );
  }

  void _storePosition(TapDownDetails details) {
    _tapPosition = details.globalPosition;
  }
}

void drawPaths(
  TouchyCanvas canvas,
  path,
  Function onTap, {
  Color color = Colors.black,
}) {
  canvas.drawPath(
      path,
      Paint()
        ..style = PaintingStyle.fill
        ..strokeWidth = 1
        ..color = color != Colors.black ? color : mapColor, onTapDown: (x) {
    onTap(x);
  });

  canvas.drawPath(
      path,
      Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = 1
        ..color = strokeColor, onTapDown: (x) {
    onTap(x);
  });
}

void drawPathsExp(
  TouchyCanvas canvas,
  path,
  Function onTap,
  Function onTapDown, {
  Color color = Colors.black,
}) {
  canvas.drawPath(
      path,
      Paint()
        ..style = PaintingStyle.fill
        ..strokeWidth = 1
        ..color = color != Colors.black ? color : mapColor, onTapDown: (x) {
    onTap(x);
  });

  canvas.drawPath(
      path,
      Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = 1
        ..color = strokeColor, onTapDown: (x) {
    onTapDown(x);
  });
}

int getCasesTwoDaysBefore(String state) {
  int cases = 0;
  var _days = 2;

  bool todayData = false; //To check if today data exist

  DateTime today = DateTime.now();
  String todayFormatted = DateFormat('yyyy-MM-dd').format(today);

  var data = ReportFormData.data['cases'];

  if (data != null) {
    var ytdData;
    var xcases;

    // Check if today data exist
    try {
      var _todayData = data[todayFormatted];
      if (_todayData != null) {
        todayData = true;
      }
    } catch (e) {
      todayData = false;
    }

    if (todayData) {
      _days = 1;
    }

    DateTime yesterday = DateTime.now().subtract(Duration(days: _days));
    String formattedDate = DateFormat('yyyy-MM-dd').format(yesterday);
    ytdData = data[formattedDate];
    xcases = ytdData[state];

    try {
      cases = int.parse(xcases);
    } catch (e) {
      print("Error converting $e");
    }
  }

  return cases;
}

int getLatestCases(String state) {
  int cases = 0;

  DateTime today = DateTime.now();
  DateTime yesterday = DateTime.now().subtract(Duration(days: 1));
  String formattedDate = DateFormat('yyyy-MM-dd').format(yesterday);
  String todayFormatted = DateFormat('yyyy-MM-dd').format(today);

  var data = ReportFormData.data['cases'];
  if (data != null) {
    var lastestData;
    var xcases;

    try {
      lastestData = data[todayFormatted];
      xcases = lastestData[state];
    } catch (e) {
      lastestData = data[formattedDate];
      xcases = lastestData[state];
    }

    try {
      cases = int.parse(xcases);
    } catch (e) {
      print("Error converting $e");
    }
  }

  return cases;
}

int getDeathTwoDaysBefore(String state) {
  int cases = 0;
  var _days = 2;

  bool todayData = false; //To check if today data exist

  DateTime today = DateTime.now();
  String todayFormatted = DateFormat('yyyy-MM-dd').format(today);

  var data = ReportFormData.data['death'];

  if (data != null) {
    var ytdData;
    var xcases;

    // Check if today data exist
    try {
      var _todayData = data[todayFormatted];
      if (_todayData != null) {
        todayData = true;
      }
    } catch (e) {
      todayData = false;
    }

    if (todayData) {
      _days = 1;
    }

    DateTime yesterday = DateTime.now().subtract(Duration(days: _days));
    String formattedDate = DateFormat('yyyy-MM-dd').format(yesterday);
    ytdData = data[formattedDate];
    xcases = ytdData[state];

    try {
      cases = int.parse(xcases);
    } catch (e) {
      print("Error converting $e");
    }
  }

  return cases;
}

int getDeathYtd(String state) {
  int death = 0;

  DateTime today = DateTime.now();
  DateTime yesterday = DateTime.now().subtract(Duration(days: 1));
  String formattedDate = DateFormat('yyyy-MM-dd').format(yesterday);
  String todayFormatted = DateFormat('yyyy-MM-dd').format(today);

  var data = ReportFormData.data['death'];
  if (data != null) {
    var lastestData;
    var xdeath;

    try {
      lastestData = data[todayFormatted];
      xdeath = lastestData[state];
    } catch (e) {
      lastestData = data[formattedDate];
      xdeath = lastestData[state];
    }

    try {
      death = int.parse(xdeath);
    } catch (e) {
      print("Error converting $e");
    }
  }

  return death;
}

int getTotPop(String state) {
  var totPop = population;
  int pop = 0;
  totPop.forEach((e) {
    if (e["state"] == state) {
      pop = int.parse(e["pop"].toString());
    }
  });
  return pop;
}

Color getColor(int cases) {
  Color color;

  var _color = [
    Colors.grey[300]!,
    // Color(0xFFF2DF91),
    Color(0xFFF9C467),
    Color(0xFFFFA83E),
    Color(0xFFAF1C43),
  ];

  if (cases < 300) {
    color = _color[0];
  } else if (cases >= 300 && cases < 1000) {
    color = _color[1];
  } else if (cases >= 1000 && cases < 2000) {
    color = _color[2];
  } else {
    color = _color[3];
  }
  return color;
}
