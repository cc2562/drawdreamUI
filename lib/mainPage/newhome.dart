import 'package:draggable_home/draggable_home.dart';
import 'package:drawdream/Widget/banner.dart';
import 'package:drawdream/Widget/bar.dart';
import 'package:drawdream/generated/assets.dart';
import 'package:drawdream/magic/text2imagePage.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class homePage extends StatefulWidget {
  const homePage({super.key});

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage>
    with SingleTickerProviderStateMixin,AutomaticKeepAliveClientMixin{

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    /*
    return DefaultTabController(
        length: 2,
        child: DraggableHome(
          title:Text("HELLO"),
          headerWidget: Container(
            width: 100.w,
            height: 35.h,
            child: PageView(
              children: [
                bannerImage(
                    'https://pic.bizhi66.com/pic/1375a7df8cc9c9a23b56e4d05178d85c',
                    "炫酷AI机甲"),
                bannerImage(
                    'https://pic.bizhi66.com/pic/7881d638b75eef36113497b49bc1e48b',
                    "美少女机甲"),
              ],
            ),
          ),

          body: [
            GridView(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 5,
              ),
              children: [
                Text("!!!")
              ],
            )
          ],
        ));

     */
    /*
    return Scaffold(
      body: Container(
        child: MediaQuery.removePadding(context: context,
        removeTop: true,
          child: ListView(
            children: [
              //顶部幻灯片
              SizedBox(
                width: 100.w,
                height: 35.h,
                child: PageView(
                  children: [
                    bannerImage('https://pic.bizhi66.com/pic/1375a7df8cc9c9a23b56e4d05178d85c',"炫酷AI机甲"),
                    bannerImage('https://pic.bizhi66.com/pic/7881d638b75eef36113497b49bc1e48b',"美少女机甲"),
                  ],
                ),
              ),
              //顶部分类
            ],
          ),
        )
      ),
    );
  }

     */


    Widget TextBUWidget(){
      return Row(
          children: [
          Text("🪄 释放魔法",style: TextStyle(fontSize: 20.sp,color: Colors.white),)
          ],
      );
    }
    return  Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            SliverOverlapAbsorber(
              handle:
              NestedScrollView.sliverOverlapAbsorberHandleFor(context),
              sliver: SliverAppBar(
                backgroundColor: Colors.black,
                title: Text("星愿魔法屋",style: TextStyle(fontSize: 18.sp,color: Colors.white,fontWeight:FontWeight.w900,shadows: [Shadow(
                    offset: const Offset(0,0),
                    blurRadius: 5.0,
                    color: Colors.black.withOpacity(0.3)
                )])),
                centerTitle: false,
                pinned: true,
                floating: true,
                snap: true,
                primary: true,
                expandedHeight: 60.h,
                elevation: 0,
                //是否显示阴影，直接取值innerBoxIsScrolled，展开不显示阴影，合并后会显示
                forceElevated: innerBoxIsScrolled,
                flexibleSpace: FlexibleSpaceBar(
                  background: Container(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 0.h),
                    decoration: BoxDecoration(
                    ),
                    width: 100.w,
                    height: 60.h,
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        PageView(
                          children: [
                            bannerImage('https://pic.bizhi66.com/pic/1375a7df8cc9c9a23b56e4d05178d85c',"炫酷AI机甲"),
                            bannerImage('https://pic.bizhi66.com/pic/7881d638b75eef36113497b49bc1e48b',"美少女机甲"),
                          ],
                        ),
                        Container(
                          width: 100.w,
                          height: 6.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(15),topRight: Radius.circular(15)),
                              //borderRadius: BorderRadius.circular(15),
                              color: Theme.of(context).cardColor
                          ),
                        ),
                        Container(
                          width: 100.w,
                          height: 9.h,
                          margin: EdgeInsets.all(3.w),
                          decoration: BoxDecoration(
                            //borderRadius: BorderRadius.only(topLeft: Radius.circular(15),topRight: Radius.circular(15)),
                            borderRadius: BorderRadius.circular(15),
                            color: Color(0xff8E7AB5),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0xff8E7AB5).withOpacity(0.8),
                                blurRadius: 10
                              )
                            ]
                          ),
                          child: TextButton(onPressed: (){},child: Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text("🪄 释放魔法",style: TextStyle(fontSize: 20.sp,color: Colors.white,fontWeight: FontWeight.w900),),
                            ],
                          ),
                          style: ButtonStyle(
                            animationDuration: Duration(microseconds: 0),
                            alignment: Alignment.centerLeft
                          ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ];
        }, body: SafeArea(
          minimum: EdgeInsets.fromLTRB(0, 0.h, 0, 0),
          bottom: false,
          child: Container(
            padding: EdgeInsets.fromLTRB(3.w, 8.h, 3.w, 0),
            child: ListView(
              children: [
                Text("热门术式",style: TextStyle(fontSize: 18.sp,fontWeight: FontWeight.bold),),
                SizedBox(height: 1.w,),
                Container(
                  width: 100.w,
                  height: 12.h,
                  child:ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(1.w, 0, 1.w, 0),
                        height: 12.h,
                        width: 12.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.red,
                          image: DecorationImage(
                            image: AssetImage(Assets.imageXiangsu), fit: BoxFit.cover
                          )
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(1.w, 0, 1.w, 0),
                        height: 12.h,
                        width: 12.h,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            image: DecorationImage(
                                image: AssetImage(Assets.image3dp), fit: BoxFit.cover
                            )
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(1.w, 0, 1.w, 0),
                        height: 12.h,
                        width: 12.h,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.green,
                            image: DecorationImage(
                                image: AssetImage(Assets.imagePzhuan), fit: BoxFit.cover
                            )
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(1.w, 0, 1.w, 0),
                        height: 12.h,
                        width: 12.h,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.purple,
                            image: DecorationImage(
                                image: AssetImage(Assets.imageFuturecg), fit: BoxFit.cover
                            ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 1.h,),
                Text("探索魔法",style: TextStyle(fontSize: 18.sp,fontWeight: FontWeight.bold),),
                SizedBox(height: 1.w,),
                GridView(
                  shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      childAspectRatio: 1,
                    ),
                  children: [
                    InkWell(
                      child:Container(
                        margin: EdgeInsets.fromLTRB(1.w, 0, 1.w, 0),
                        height: 12.h,
                        width: 12.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Theme.of(context).highlightColor.withOpacity(0.1),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Iconsax.text),
                            SizedBox(height: 1.w,),
                            Text("文生图")
                          ],
                        ),
                      ),
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>const text2ImagePage()));
                      },
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(1.w, 0, 1.w, 0),
                      height: 12.h,
                      width: 12.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Theme.of(context).highlightColor.withOpacity(0.1),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Iconsax.image),
                          SizedBox(height: 1.w,),
                          Text("图生图")
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(1.w, 0, 1.w, 0),
                      height: 12.h,
                      width: 12.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Theme.of(context).highlightColor.withOpacity(0.1),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Iconsax.user),
                          SizedBox(height: 1.w,),
                          Text("人像重绘")
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(1.w, 0, 1.w, 0),
                      height: 12.h,
                      width: 12.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Theme.of(context).highlightColor.withOpacity(0.1),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.qr_code),
                          SizedBox(height: 1.w,),
                          Text("AI二维码")
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 3.h,),
                Center(
                  child: Text("星愿魔法屋",style: TextStyle(color: Colors.grey),),
                )
              ],
            )
          )
      )
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
