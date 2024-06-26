import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

Widget bannerImage(String imageUrl,String title){

  return   CachedNetworkImage(
    imageUrl: imageUrl,
    imageBuilder: (context, imageProvider) => Container(
      width: 100.w,
      height: 60.h,
      margin: EdgeInsets.fromLTRB(0, 0, 0, 1.h),
      alignment: Alignment.bottomLeft,
      padding: EdgeInsets.fromLTRB(2.w, 0, 2.w, 12.5.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
          image: DecorationImage(
              image: imageProvider,
              fit: BoxFit.cover
          )
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(title,style: TextStyle(fontSize: 20.sp,color: Colors.white,fontWeight:FontWeight.w900,shadows: [Shadow(
              offset: const Offset(0,0),
              blurRadius: 5.0,
              color: Colors.black.withOpacity(0.3)
          )]),)
        ],
      ),
    ),
    placeholder: (context, url) => Container(
      width: 10.w,
      height: 10.h,
      child: CircularProgressIndicator(),
    ),
    errorWidget: (context, url, error) => Icon(Icons.error),
  );

}