// import 'dart:math';
// import 'dart:ui';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:intl/intl.dart';
// import 'package:responsive_sizer/responsive_sizer.dart';
// import 'package:touchable/touchable.dart';
// import 'package:website/common/colors.dart';
// import 'package:website/data/cases_state.dart';
// import 'package:website/data/death_state.dart';
// import 'package:website/data/population.dart';
// import 'package:website/paint/labuan.dart';
// import 'package:website/paint/sabah.dart';
// import 'package:website/paint/sarawak.dart';
// import 'package:website/paint/terengganu.dart';
// import 'package:website/paint/selangor.dart';
// import 'package:website/paint/perlis.dart';
// import 'package:website/paint/perak.dart';
// import 'package:website/paint/penang.dart';
// import 'package:website/paint/pahang.dart';
// import 'package:website/paint/nsembilan.dart';
// import 'package:website/paint/kelantan.dart';
// import 'package:website/paint/kedah.dart';
// import 'package:website/paint/johor.dart';
// import 'package:website/paint/melaka.dart';
// import 'package:website/style/style.dart';



// class MainMaps extends StatefulWidget {
//   @override
//   _MainMapsState createState() => _MainMapsState();
// }

// class _MainMapsState extends State<MainMaps> with TickerProviderStateMixin {
//   var maps = ["SS", "SM"];
//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(length: 2, 
//       child: SafeArea(
//         child: Container(
//           child: Column(
//             children: [
//               TabBar(
//               tabs: [
//                 Tab(
//                    text: ("One"),
//                 ),
//                 Tab(
//                   text: ("Two"),
//                 ),
           
//               ],
//             ),
//           Container(
//            height: Get.height,
//             child: TabBarView(children: [
//                   Transform.scale(
//                   alignment: FractionalOffset.topCenter,
//                   scale: Get.width > 500 ? 0.5 : 0.7,
//                   child: Container(
//                     child: CanvasTouchDetector(
//                       builder: (context) {
//                         return CustomPaint(
//                           size: Size(Get.width,
//                               (Get.width * 1.3769633507853403).toDouble()),
//                           //  size: Size(Get.width, (Get.width * 1.3769633507853403).toDouble()),
//                           // Get.width,
//                           // (Get.width * 0.3308204960246437 * (Get.width <= 500 ? 2 : 1))
//                           //     .toDouble()),
//                           painter: MyPainter(context),
//                         );
//                       },
//                     ),
//                   ),
//                 ),
//             Center( child: Text("Two",style: TextStyle(fontSize: 50),)),
                 
//                   ]),
//           ),
              
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class MyPainter extends CustomPainter {
//   final BuildContext context;
//   MyPainter(this.context);
//   Color strokeColor = Colors.black;
//   var _tapPosition;
//   @override
//   void paint(Canvas _canvas, Size size) {
//     TouchyCanvas canvas = TouchyCanvas(context, _canvas);

//     drawJohor(canvas, size);
//     drawKedah(canvas, size);
//     drawKelantan(canvas, size);
//     drawMelaka(canvas, size);
//     drawNS(canvas, size);
//     drawPahang(canvas, size);
//     drawPenang(canvas, size);
//     drawPerak(canvas, size);
//     drawPerlis(canvas, size);
//     drawSelangor(canvas, size);
//     drawTerengganu(canvas, size);

//     // drawSabah(canvas, size);
//     // drawSarawak(canvas, size);
//     // drawLabuan(canvas, size);
//   }

//   void drawLabuan(TouchyCanvas canvas, Size size) {
//     int death = getDeathYtd("W.P. Labuan");
//     int totPopulation = getTotPop("W.P. Labuan");
//     int latestCases = getLatestCases("W.P. Labuan");
//     Color color = getColor(latestCases);
//     Path path_0 = getLabuan(size);
//     void onDraw(_) {
//       _storePosition(_);
//       _showPopupMenu("W.P. Labuan", latestCases, totPopulation, death);
//     }

//     drawPaths(canvas, path_0, onDraw, color: color);
//   }

//   void drawSarawak(TouchyCanvas canvas, Size size) {
//     int death = getDeathYtd("Sarawak");
//     int totPopulation = getTotPop("Sarawak");
//     int latestCases = getLatestCases("Sarawak");
//     Color color = getColor(latestCases);
//     Path path_0 = getSarawak(size);
//     void onDraw(_) {
//       _storePosition(_);
//       _showPopupMenu("Sarawak", latestCases, totPopulation, death);
//     }

//     drawPaths(canvas, path_0, onDraw, color: color);
//   }

//   void drawTerengganu(TouchyCanvas canvas, Size size) {
//     int death = getDeathYtd("Terengganu");
//     int totPopulation = getTotPop("Terengganu");
//     int latestCases = getLatestCases("Terengganu");
//     Color color = getColor(latestCases);
//     Path path_0 = getTerengganu(size);
//     void onDraw(_) {
//       _storePosition(_);
//       _showPopupMenu("Terengganu", latestCases, totPopulation, death);
//     }

//     drawPaths(canvas, path_0, onDraw, color: color);
//   }

//   void drawSelangor(TouchyCanvas canvas, Size size) {
//     int death = getDeathYtd("Selangor");
//     int totPopulation = getTotPop("Selangor");
//     int latestCases = getLatestCases("Selangor");
//     Color color = getColor(latestCases);
//     Path path_0 = getSelangor(size);
//     void onDraw(_) {
//       _storePosition(_);
//       _showPopupMenu("Selangor", latestCases, totPopulation, death);
//     }

//     drawPaths(canvas, path_0, onDraw, color: color);
//   }

//   void drawPerlis(TouchyCanvas canvas, Size size) {
//     int death = getDeathYtd("Perlis");
//     int totPopulation = getTotPop("Perlis");
//     int latestCases = getLatestCases("Perlis");
//     Color color = getColor(latestCases);
//     Path path_0 = getPerlis(size);
//     void onDraw(_) {
//       _storePosition(_);
//       _showPopupMenu("Perlis", latestCases, totPopulation, death);
//     }

//     drawPaths(canvas, path_0, onDraw, color: color);
//   }

//   void drawPerak(TouchyCanvas canvas, Size size) {
//     int death = getDeathYtd("Perak");
//     int totPopulation = getTotPop("Perak");
//     int latestCases = getLatestCases("Perak");
//     Color color = getColor(latestCases);
//     Path path_0 = getPerak(size);
//     void onDraw(_) {
//       _storePosition(_);
//       _showPopupMenu("Perak", latestCases, totPopulation, death);
//     }

//     drawPaths(canvas, path_0, onDraw, color: color);
//   }

//   void drawPenang(TouchyCanvas canvas, Size size) {
//     int death = getDeathYtd("Pulau Pinang");
//     int totPopulation = getTotPop("Pulau Pinang");
//     int latestCases = getLatestCases("Pulau Pinang");
//     Color color = getColor(latestCases);
//     Path path_0 = getPenang(size);

//     void onDraw(_) {
//       _storePosition(_);
//       _showPopupMenu("Pulau Pinang", latestCases, totPopulation, death);
//     }

//     drawPaths(canvas, path_0, onDraw, color: color);
//   }

//   void drawPahang(TouchyCanvas canvas, Size size) {
//     int death = getDeathYtd("Pahang");
//     int totPopulation = getTotPop("Pahang");
//     int latestCases = getLatestCases("Pahang");
//     Color color = getColor(latestCases);
//     Path path_0 = getPahang(size);
//     void onDraw(_) {
//       _storePosition(_);
//       _showPopupMenu("Pahang", latestCases, totPopulation, death);
//     }

//     drawPaths(canvas, path_0, onDraw, color: color);
//   }

//   void drawNS(TouchyCanvas canvas, Size size) {
//     int death = getDeathYtd("Negeri Sembilan");
//     int totPopulation = getTotPop("Negeri Sembilan");
//     int latestCases = getLatestCases("Negeri Sembilan");
//     Color color = getColor(latestCases);
//     Path path_0 = getNS(size);
//     void onDraw(_) {
//       _storePosition(_);
//       _showPopupMenu("Negeri Sembilan", latestCases, totPopulation, death);
//     }

//     drawPaths(canvas, path_0, onDraw, color: color);
//   }

//   void drawMelaka(TouchyCanvas canvas, Size size) {
//     int death = getDeathYtd("Melaka");
//     int totPopulation = getTotPop("Melaka");
//     int latestCases = getLatestCases("Melaka");
//     Color color = getColor(latestCases);
//     Path path_0 = getMelaka(size);
//     void onDraw(_) {
//       _storePosition(_);
//       _showPopupMenu("Melaka", latestCases, totPopulation, death);
//     }

//     drawPaths(canvas, path_0, onDraw, color: color);
//   }

//   void drawSabah(TouchyCanvas canvas, Size size) {
//     int death = getDeathYtd("Sabah");
//     int totPopulation = getTotPop("Sabah");
//     int latestCases = getLatestCases("Sabah");
//     Color color = getColor(latestCases);
//     Path path_0 = getSabah(size);
//     void onDraw(_) {
//       _storePosition(_);
//       _showPopupMenu("Sabah", latestCases, totPopulation, death);
//     }

//     drawPaths(canvas, path_0, onDraw, color: color);
//   }

//   void drawJohor(TouchyCanvas canvas, Size size) {
//     int death = getDeathYtd("Johor");
//     int totPopulation = getTotPop("Johor");
//     int latestCases = getLatestCases("Johor");
//     Color color = getColor(latestCases);

//     Path path_0 = getJohor(size);
//     void onDraw(_) {
//       _storePosition(_);
//       _showPopupMenu("Johor", latestCases, totPopulation, death);
//     }

//     drawPaths(canvas, path_0, onDraw, color: color);
//   }

//   void drawKedah(TouchyCanvas canvas, Size size) {
//     int death = getDeathYtd("Kedah");
//     int totPopulation = getTotPop("Kedah");
//     int latestCases = getLatestCases("Kedah");
//     Color color = getColor(latestCases);
//     Path path_0 = getKedah(size);
//     void onDraw(_) {
//       _storePosition(_);
//       _showPopupMenu("Kedah", latestCases, totPopulation, death);
//     }

//     drawPaths(canvas, path_0, onDraw, color: color);
//   }

//   void drawKelantan(TouchyCanvas canvas, Size size) {
//     int death = getDeathYtd("Kelantan");
//     int totPopulation = getTotPop("Kelantan");
//     int latestCases = getLatestCases("Kelantan");
//     Color color = getColor(latestCases);
//     Path path_0 = getKelantan(size);
//     void onDraw(_) {
//       _storePosition(_);
//       _showPopupMenu("Kelantan", latestCases, totPopulation, death);
//     }

//     drawPaths(canvas, path_0, onDraw, color: color);
//   }

//   @override
//   bool shouldRepaint(CustomPainter oldDelegate) {
//     return true;
//   }

//   _showPopupMenu(String state, int cases, int pop, int death) async {
//     final RenderBox overlay =
//         Overlay.of(context)!.context.findRenderObject() as RenderBox;

//     await showMenu(
//       context: context,
//       position: RelativeRect.fromRect(
//           _tapPosition & Size(40, 40), // smaller rect, the touch area
//           Offset.zero & overlay.size // Bigger rect, the entire screen
//           ),
//       items: [
//         PopupMenuItem(
//             child: Container(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(state, style: cbFont(14, adapt: false)),
//               SizedBox(height: 4),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text("CASES YESTERDAY", style: cnFont(11, adapt: false)),
//                   Text("DEATH YESTERDAY", style: cnFont(11, adapt: false)),
//                 ],
//               ),
//               Divider(),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(cases.toString(), style: cnFont(25, adapt: false)),
//                   Text(death.toString(), style: cnFont(25, adapt: false)),
//                 ],
//               ),
//             ],
//           ),
//         ))
//       ],
//       elevation: 8.0,
//     );
//   }

//   void _storePosition(TapDownDetails details) {
//     _tapPosition = details.globalPosition;
//   }
// }

// void drawPaths(
//   TouchyCanvas canvas,
//   path,
//   Function onTap, {
//   Color color = Colors.black,
// }) {
//   canvas.drawPath(
//       path,
//       Paint()
//         ..style = PaintingStyle.fill
//         ..strokeWidth = 1
//         ..color = color != Colors.black ? color : mapColor, onTapDown: (x) {
//     onTap(x);
//   });

//   canvas.drawPath(
//       path,
//       Paint()
//         ..style = PaintingStyle.stroke
//         ..strokeWidth = 1
//         ..color = strokeColor, onTapDown: (x) {
//     onTap(x);
//   });
// }

// void drawPathsExp(
//   TouchyCanvas canvas,
//   path,
//   Function onTap,
//   Function onTapDown, {
//   Color color = Colors.black,
// }) {
//   canvas.drawPath(
//       path,
//       Paint()
//         ..style = PaintingStyle.fill
//         ..strokeWidth = 1
//         ..color = color != Colors.black ? color : mapColor, onTapDown: (x) {
//     onTap(x);
//   });

//   canvas.drawPath(
//       path,
//       Paint()
//         ..style = PaintingStyle.stroke
//         ..strokeWidth = 1
//         ..color = strokeColor, onTapDown: (x) {
//     onTapDown(x);
//   });
// }

// int getLatestCases(String state) {
//   int cases = 0;
//   DateTime yesterday = DateTime.now().subtract(Duration(days: 1));
//   String formattedDate = DateFormat('yyyy-MM-dd').format(yesterday);

//   var _casesByState = casesByState;
//   _casesByState.forEach((e) {
//     if (e["state"] == state) {
//       if (e["date"] == formattedDate) {
//         cases = int.parse(e["cases_new"].toString());
//       }
//     }
//   });

//   return cases;
// }

// int getDeathYtd(String state) {
//   int death = 0;
//   DateTime yesterday = DateTime.now().subtract(Duration(days: 1));
//   String formattedDate = DateFormat('yyyy-MM-dd').format(yesterday);

//   var _deathByState = deathByState;
//   _deathByState.forEach((e) {
//     if (e["state"] == state) {
//       if (e["date"] == formattedDate) {
//         try {
//           death = int.parse(e["deaths_new"].toString());
//         } catch (e) {
//           death = 0;
//         }
//       }
//     }
//   });

//   return death;
// }

// int getTotPop(String state) {
//   var totPop = population;
//   int pop = 0;
//   totPop.forEach((e) {
//     if (e["state"] == state) {
//       pop = int.parse(e["pop"].toString());
//     }
//   });
//   return pop;
// }

// Color getColor(int cases) {
//   Color color;

//   var _color = [
//     Color(0xFFF2DF91),
//     Color(0xFFF9C467),
//     Color(0xFFFFA83E),
//     Color(0xFFAF1C43),
//   ];

//   if (cases < 500) {
//     color = _color[0];
//   } else if (cases >= 500 && cases < 1000) {
//     color = _color[1];
//   } else if (cases >= 1000 && cases < 2000) {
//     color = _color[2];
//   } else {
//     color = _color[3];
//   }
//   return color;
// }
