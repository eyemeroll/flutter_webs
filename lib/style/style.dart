
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:website/common/utils.dart';


// gn = google normal font
TextStyle gnFont(_fontSize, {Color color = Colors.black}){
  return GoogleFonts.notoSerif(fontSize: _fontSize ?? 18.sp, fontWeight: FontWeight.normal,color: color);
}

TextStyle gmFont(_fontSize, {Color color = Colors.black}){
  return GoogleFonts.notoSerif(fontSize: _fontSize ?? 18.sp, fontWeight: FontWeight.w600,color: color);
}

TextStyle gbFont(_fontSize, {Color color = Colors.black}){
  return GoogleFonts.notoSerif(fontSize: _fontSize ?? 18.sp, fontWeight: FontWeight.bold, color: color);
}

// cn = custom normal font
TextStyle cnFont(_fontSize, {Color color = Colors.black, bool adapt = true}){
  return TextStyle(fontFamily: "Haas", fontSize: !adapt ? _fontSize : cf(_fontSize), fontWeight: FontWeight.w300,color: color);
}


TextStyle cmFont(_fontSize, {Color color = Colors.black, bool adapt = true}){
  return TextStyle(fontFamily: "Haas", fontSize: !adapt ? _fontSize : cf(_fontSize), fontWeight: FontWeight.w500,color: color);
}


TextStyle cbFont(_fontSize, {Color color = Colors.black, bool adapt = true}){
  return TextStyle(fontFamily: "Haas", fontSize: !adapt ? _fontSize : cf(_fontSize), fontWeight: FontWeight.w800,color: color);
}