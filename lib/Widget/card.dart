import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

Widget CardWidget(context,Widget theChild,double thewidth,double theheight){

  return Container(
    padding: EdgeInsets.all(2.w),
    width: thewidth,
    height: theheight,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15),
      color: Theme.of(context).highlightColor.withOpacity(0.1),
    ),
    child:theChild,
  );
}