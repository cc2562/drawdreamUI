import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

Widget TabBarWidget(context,String em,String title){

  return Container(
    height: 5.h,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.only(bottomRight: Radius.circular(15),bottomLeft: Radius.circular(15)),
      //color: Theme.of(context).scaffoldBackgroundColor,
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0),
          offset: Offset(0,0),
          blurRadius: 0
        )
      ]
    ),
    padding: EdgeInsets.fromLTRB(2.w, 0, 2.w, 0),
    margin: EdgeInsets.fromLTRB(0, 0, 1.w, 0),
    child: Row(
      children: [
        Text(em,style: TextStyle(fontSize: 16.sp,fontWeight: FontWeight.w900),),
        SizedBox(width: 1.w),
        Text(title,style: TextStyle(fontSize: 16.sp,fontWeight: FontWeight.w500))
      ],
    ),
  );
}