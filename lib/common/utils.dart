import 'package:responsive_sizer/responsive_sizer.dart';

/// We use something like middleware
/// so that if we decide not to use / change this later on
/// we can just change it here

//Change height
double ch(double height){
  return Adaptive.h(height);
}

//Change width
double cw(double width){
  return Adaptive.w(width);
}

//Change font
double cf(double font){
  return font.sp;
}