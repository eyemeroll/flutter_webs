import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';

import 'package:website/screen/main_maps.dart';
import 'package:website/screen/test.dart';
import 'package:website/style/style.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:latlong2/latlong.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
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
                        "Malaysia Times",
                        style: gmFont(13.sp, color: Colors.white),
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
                          style: gmFont(20.sp, color: Colors.black,).copyWith(letterSpacing: -2),
                        ),),
                ),
                Center(child: Text("Updated on 9 Aug 2021", style: cnFont(12, color: Colors.red),)),
                Padding(
                  padding: const EdgeInsets.all(22.0),
                  child: Center(child: Container(
                    width: Get.width > 500 ? Adaptive.w(70) : Adaptive.w(90),
                     child: MainMaps())),
                ),
                // Container(
                //   height: 500,
                //   width: 500,
                //   child: RecentsPage(),)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
