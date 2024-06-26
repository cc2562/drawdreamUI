import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

Widget TextContent(String title){
  return Container(
    padding: EdgeInsets.fromLTRB(0, 1.w, 0, 2.w),
    child:Text(title,style: TextStyle(fontSize: 16.sp,fontWeight: FontWeight.w700),),
  );
}