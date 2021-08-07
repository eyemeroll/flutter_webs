
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle rf(_fontSize, {Color color}){
  return GoogleFonts.lato(fontSize: _fontSize ?? 18, fontWeight: FontWeight.normal,color: color ?? Colors.black);
}

TextStyle sf(_fontSize, {Color color}){
  return GoogleFonts.lato(fontSize: _fontSize ?? 18, fontWeight: FontWeight.w600,color: color ?? Colors.black);
}

TextStyle bf(_fontSize, {Color color}){
  return GoogleFonts.lato(fontSize: _fontSize ?? 18, fontWeight: FontWeight.bold, color: color ?? Colors.black);
}