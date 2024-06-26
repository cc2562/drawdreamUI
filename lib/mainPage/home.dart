import 'package:draggable_home/draggable_home.dart';
import 'package:drawdream/Widget/banner.dart';
import 'package:drawdream/Widget/bar.dart';
import 'package:flutter/material.dart';
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



    return  Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            SliverOverlapAbsorber(
              handle:
              NestedScrollView.sliverOverlapAbsorberHandleFor(context),
              sliver: SliverAppBar(
                centerTitle: false,
                pinned: true,
                floating: false,
                snap: false,
                primary: false,
                expandedHeight: 35.h,
                elevation: 0,
                //是否显示阴影，直接取值innerBoxIsScrolled，展开不显示阴影，合并后会显示
                forceElevated: innerBoxIsScrolled,
                flexibleSpace: FlexibleSpaceBar(
                  background: Container(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 6.h),
                    decoration: BoxDecoration(
                    ),
                    width: 100.w,
                    height: 35.h,
                    child: PageView(
                      children: [
                        bannerImage('https://pic.bizhi66.com/pic/1375a7df8cc9c9a23b56e4d05178d85c',"炫酷AI机甲"),
                        bannerImage('https://pic.bizhi66.com/pic/7881d638b75eef36113497b49bc1e48b',"美少女机甲"),
                      ],
                    ),
                  ),
                ),

                bottom: TabBar(

                  // indicatorPadding: EdgeInsets.only(left: 0.0),
                  isScrollable: true,
                  labelPadding: EdgeInsets.only(left: 1.w,right: 1.w),
                  tabAlignment: TabAlignment.start,
                  indicator: const BoxDecoration(),
                  controller: _tabController,
                  tabs: [
                    TabBarWidget(context,"🏠","首页"),TabBarWidget(context,"🎨","动漫"),TabBarWidget(context,"🦊","动物"),TabBarWidget(context,"✨","风景"),
                  ],
                ),
              ),
            ),
          ];
        }, body: TabBarView(
      controller: _tabController,
        children: [
          SafeArea(
            minimum: EdgeInsets.fromLTRB(0, 0.h, 0, 0),
            bottom: false,
              child: Container(
                padding: EdgeInsets.fromLTRB(1.w, 8.h, 1.w, 0),
                child: GridView(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.5625
                  ),
                  children: [
                    Container(
                      alignment: Alignment.bottomLeft,
                      height: 60.h,
                      decoration: BoxDecoration(
                        color: Theme.of(context).cardColor,
                        image: DecorationImage(
                          image: NetworkImage("https://pic.bizhi66.com/pic/1375a7df8cc9c9a23b56e4d05178d85c"),
                          fit: BoxFit.cover
                        ),
                        borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.withOpacity(0.2),
                                offset: Offset(0,0),
                                blurRadius: 3
                            )
                          ]
                      ),
                      child: Container(
                        //width: 100.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),

                        ),
                        padding: EdgeInsets.fromLTRB(2.w, 1.h, 2.w, 1.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [Text("帅气机甲",style: TextStyle(fontSize: 18.sp,color: Colors.white,fontWeight:FontWeight.w900,shadows: [Shadow(
                          offset: const Offset(0,0),
                              blurRadius: 5.0,
                              color: Colors.black.withOpacity(0.3)
                          )]),),Text("文生图",style: TextStyle(fontSize: 14.sp,color: Colors.white,fontWeight:FontWeight.w900,shadows: [Shadow(
                              offset: const Offset(0,0),
                              blurRadius: 5.0,
                              color: Colors.black.withOpacity(0.3)
                          )]),)],
                        ),
                      ),
                    )
                  ],
                ),
              )
          )
          ],
      ),
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
