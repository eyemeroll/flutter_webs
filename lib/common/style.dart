import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle boldLogoFont(){
  return GoogleFonts.rubik(fontSize: 18, color: Colors.black, fontWeight: FontWeight.w600);
}

TextStyle lightLogoFont(){
  return GoogleFonts.rubik(fontSize: 18, color: Colors.black, fontWeight: FontWeight.w100);
}

TextStyle standardFont({Color color}){
  return GoogleFonts.rubik(color: color != null ? color : Colors.black);
}