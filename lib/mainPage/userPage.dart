import 'dart:ui';

import 'package:drawdream/user/login.dart';
import 'package:drawdream/user/vip.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../generated/assets.dart';

class userPage extends StatefulWidget {
  const userPage({super.key});

  @override
  State<userPage> createState() => _userPageState();
}

class _userPageState extends State<userPage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Future.delayed(const Duration(milliseconds: 500), () {
     
    });

  }
  bool islogin=true;

  void showVipPage(){
    showCupertinoModalBottomSheet(
      expand: false,
      context: context,
      enableDrag: true,
      isDismissible: true,
      builder: (context) => vipPage(),
    ).then((value){
      if(value == null){
        showDialog(context: context,
            barrierDismissible: false,
            builder: (context){
              return PopScope(canPop: false,child: SimpleDialog(
                children: [
                  AspectRatio(aspectRatio: 900/383,
                    child:                     Container(
                      width: 100.w,
                      height: 10.h,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(Assets.imageYhbg),
                              fit: BoxFit.cover
                          )
                      ),
                    ),
                  ),
                  TextButton(onPressed: (){
                    Navigator.pop(context);
                    showVipPage();
                  }, child: Text("留下看看")),
                  TextButton(onPressed: (){
                    Navigator.pop(context);
                    return;
                  }, child: Text("关闭"))
                ],
              ),);
            }
        );
      }
    });
  }
  Widget logined(){
    return Container(
      child: ListView(
        children: [

          Container(
            margin: EdgeInsets.fromLTRB(0.w, 1.h, 0.w, 0),
            width: 100.w,
            height: 26.h,
            decoration: BoxDecoration(
              //color: Colors.red,
                borderRadius: BorderRadius.circular(15)
            ),
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(2.w, 3.w, 2.w, 0.h),
                  width: 100.w,
                  height: 25.h,
                  decoration: BoxDecoration(
                    //border: Border.all(color: Colors.white,width: 1.w),
                      borderRadius: BorderRadius.circular(15),
                      image: DecorationImage(
                          image: NetworkImage("https://images.tusiassets.com/community/images/603953890236362106/0e9c3ebe108bc8e8fe5ee37862dd9613.png!mfit_w2048_h2048_jpg"),
                          fit: BoxFit.cover
                      )
                  ),
                ),
                Container(
                  width: 100.w,
                  height: 10.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(topRight: Radius.circular(15),topLeft: Radius.circular(15))
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 0, 0, 5.h),
                  width: 15.h,
                  height: 15.h,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.white,width: 0.5.w),
                      borderRadius: BorderRadius.circular(100),
                      image: DecorationImage(
                          image: NetworkImage("https://pic.bizhi66.com/pic/1375a7df8cc9c9a23b56e4d05178d85c"),
                          fit: BoxFit.cover
                      )
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 1.h),
                  child: Text("这是用户名",style: TextStyle(fontWeight:FontWeight.bold,fontSize: 18.sp),),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(3.w, 1.h, 3.w, 0),
            padding: EdgeInsets.fromLTRB(2.w, 1.w, 2.w, 1.w),
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(15),topRight: Radius.circular(15)),
                color: Colors.amber
            ),
            child: Flex(direction: Axis.horizontal,children: [
              Expanded(
                  flex: 4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("星愿魔法月卡",style: TextStyle(fontSize: 16.sp,fontWeight: FontWeight.w900),),
                      Text("开通月卡每天获得100魔力值"),
                    ],
                  )
              ),
              Expanded(
                  child: IconButton(
                    onPressed: (){
                      showVipPage();
                    },
                    icon: Icon(Icons.arrow_forward_ios_rounded),
                  )
              ),
            ],

            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(3.w, 0, 3.w, 0),
            padding: EdgeInsets.fromLTRB(2.w, 1.w, 2.w, 1.w),
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15),bottomRight: Radius.circular(15)),
                color: Color(0xffB784B7)
            ),
            child: Flex(direction: Axis.horizontal,children: [
              Expanded(
                  flex: 4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("任务中心",style: TextStyle(fontSize: 16.sp,fontWeight: FontWeight.w900),),
                      Text("完成任务得魔力值"),
                    ],
                  )
              ),
              Expanded(
                  child: IconButton(
                    onPressed: (){},
                    icon: Icon(Icons.arrow_forward_ios_rounded),
                  )
              ),
            ],

            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(3.w, 1.h, 3.w, 0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Theme.of(context).highlightColor.withOpacity(0.1),
            ),
            child:ListView(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              children: [
                ListTile(
                  title: Text("我的作品"),
                  trailing: Icon(Icons.arrow_forward_ios_rounded),
                  leading: Icon(Iconsax.gallery),
                ),
                ListTile(
                  title: Text("个人资料"),
                  trailing: Icon(Icons.arrow_forward_ios_rounded),
                  leading: Icon(Iconsax.user_edit),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(3.w, 1.h, 3.w, 0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Theme.of(context).highlightColor.withOpacity(0.1),
            ),
            child:ListView(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              children: [
                ListTile(
                  title: Text("关于星愿魔法屋"),
                  trailing: Icon(Icons.arrow_forward_ios_rounded),
                  leading: Icon(Iconsax.link),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(3.w, 1.h, 3.w, 0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Theme.of(context).highlightColor.withOpacity(0.1),
            ),
            child:ListView(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              children: [
                ListTile(
                  title: Text("退出登录"),
                  trailing: Icon(Icons.arrow_forward_ios_rounded),
                  leading: Icon(Iconsax.logout),
                ),
                ListTile(
                  title: Text("注销账号"),
                  trailing: Icon(Icons.arrow_forward_ios_rounded),
                  leading: Icon(Iconsax.user_remove),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget unLogin(){
    return Container(
      child: ListView(
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(3.w, 1.h, 3.w, 0),
            padding: EdgeInsets.fromLTRB(3.w, 1.h, 3.w, 1.h),
            width: 100.w,
            decoration: BoxDecoration(
                color: Theme.of(context).highlightColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(15)
            ),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 1.h, 0, 1.h),
                  child: Text("登录使用所有魔法",style: TextStyle(fontWeight:FontWeight.bold,fontSize: 18.sp),),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>const loginPage())).then((value) => print("IS"));
                      },
                      child: Text("登录",style: TextStyle(fontSize: 16.sp),),
                      style: ButtonStyle(
                          //backgroundColor: MaterialStateProperty.all(Colors.amber),
                          shape: MaterialStateProperty.all(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)
                          ))
                      ),
                    ),

              ],
            ),
    ],
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(3.w, 1.h, 3.w, 0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Theme.of(context).highlightColor.withOpacity(0.1),
            ),
            child:ListView(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              children: [
                ListTile(
                  title: Text("关于星愿魔法屋"),
                  trailing: Icon(Icons.arrow_forward_ios_rounded),
                  leading: Icon(Iconsax.link),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("我的小屋"),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Iconsax.setting))
        ],
      ),
      extendBodyBehindAppBar: true,
      extendBody: true,
      body: islogin?logined():unLogin(),
    );
  }
}
