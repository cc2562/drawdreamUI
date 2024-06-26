import 'package:drawdream/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class vipPage extends StatefulWidget {
  const vipPage({super.key});

  @override
  State<vipPage> createState() => _vipPageState();
}

class _vipPageState extends State<vipPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.w,
      height: 70.h,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text("魔法月卡"),
          actions: [
            IconButton(onPressed: (){

              showDialog(context: context,
                  builder: (context){
                return SimpleDialog(
                  children: [
                    AspectRatio(aspectRatio: 900/383,
                    child:                     Container(
                      width: 100.w,
                      height: 10.h,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(Assets.imageYhbg),
                              fit: BoxFit.cover
                          )
                      ),
                    ),
                    ),
                    TextButton(onPressed: (){
                      Navigator.pop(context);
                    }, child: Text("留下看看")),
                    TextButton(onPressed: (){
                      Navigator.pop(context);
                      Navigator.pop(context,true);
                      return;
                    }, child: Text("关闭"))
                  ],
                );
                  }
              );
            }, icon: Icon(Iconsax.close_circle))
          ],
        ),
        body: Padding(
          padding: EdgeInsets.fromLTRB(3.w, 1.h, 3.w,0),
          child: ListView(
            children: [
              Container(
                width: 100.w,
                height: 18.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Theme.of(context).highlightColor.withOpacity(0.1),
                  image: DecorationImage(
                    image: AssetImage(Assets.imageVIP),
                    fit: BoxFit.cover
                  )
                ),
              ),
              SizedBox(height: 1.h,),
              Container(
                width: 100.w,
                height: 13.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                ),
                child:Flex(
                  direction: Axis.horizontal,
                  children: [
                    Expanded(
                      flex: 1,
                      child: GestureDetector(
                        onTap: (){},
                        child: Container(
                          padding: EdgeInsets.fromLTRB(2.w, 1.h, 2.w,0),
                          margin: EdgeInsets.fromLTRB(1.w, 0, 1.w, 0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.amber.withOpacity(0.1),
                            border:Border.all(color: Colors.amber)
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("1个月"),
                              SizedBox(height: 1.h,),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("￥",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 16.sp),),
                                  Text("20",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 20.sp),),
                                ],
                              ),
                              SizedBox(height: 1.h,),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("原价",style: TextStyle(color: Colors.amber),),
                                  Text("￥30",style: TextStyle(
                                    decoration: TextDecoration.lineThrough,
                                    fontWeight: FontWeight.bold,
                                    decorationColor: Colors.amber,color: Colors.amber ),)
                                ],
                              ),

                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: GestureDetector(
                        onTap: (){},
                        child: Container(
                          padding: EdgeInsets.fromLTRB(2.w, 1.h, 2.w,0),
                          margin: EdgeInsets.fromLTRB(1.w, 0, 1.w, 0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Theme.of(context).highlightColor.withOpacity(0.1),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("3个月"),
                              SizedBox(height: 1.h,),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("￥",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 16.sp),),
                                  Text("55",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 20.sp),),
                                ],
                              ),
                              SizedBox(height: 1.h,),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("原价",style: TextStyle(color: Colors.grey),),
                                  Text("￥90",style: TextStyle(
                                      decoration: TextDecoration.lineThrough,
                                      fontWeight: FontWeight.bold,
                                      decorationColor: Colors.grey,color: Colors.grey ),)
                                ],
                              ),

                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: GestureDetector(
                        onTap: (){},
                        child: Container(
                          padding: EdgeInsets.fromLTRB(2.w, 1.h, 2.w,0),
                          margin: EdgeInsets.fromLTRB(1.w, 0, 1.w, 0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Theme.of(context).highlightColor.withOpacity(0.1),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("1年"),
                              SizedBox(height: 1.h,),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("￥",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 16.sp),),
                                  Text("200",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 20.sp),),
                                ],
                              ),
                              SizedBox(height: 1.h,),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("原价",style: TextStyle(color: Colors.grey),),
                                  Text("￥360",style: TextStyle(
                                      decoration: TextDecoration.lineThrough,
                                      fontWeight: FontWeight.bold,
                                      decorationColor: Colors.grey,color: Colors.grey ),)
                                ],
                              ),

                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: GestureDetector(
                        onTap: (){},
                        child: Container(
                          padding: EdgeInsets.fromLTRB(2.w, 1.h, 2.w,0),
                          margin: EdgeInsets.fromLTRB(1.w, 0, 1.w, 0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Theme.of(context).highlightColor.withOpacity(0.1),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("2年"),
                              SizedBox(height: 1.h,),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("￥",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 16.sp),),
                                  Text("400",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 20.sp),),
                                ],
                              ),
                              SizedBox(height: 1.h,),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("原价",style: TextStyle(color: Colors.grey),),
                                  Text("￥720",style: TextStyle(
                                      decoration: TextDecoration.lineThrough,
                                      fontWeight: FontWeight.bold,
                                      decorationColor: Colors.grey,color: Colors.grey ),)
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 2.w,),
              Text("*所有价格均无自动续费",style: TextStyle(fontSize: 14.sp),),
              SizedBox(height: 1.h,),
              Row(
                children: [
                  Checkbox(value: false, onChanged: (f){}),
                  Text("我已阅读并同意《会员协议》"),
                ],
              ),
              ElevatedButton(onPressed: (){}, child: Text("立即购买")),
              Text("*当前仅支持支付宝付款",style: TextStyle(fontSize: 14.sp),),
              SizedBox(height: 1.h,),
              Divider(color:  Theme.of(context).highlightColor.withOpacity(0.1),),
              Row(
                children: [
                  TextButton(onPressed: (){}, child: Text("会员协议")),
                  TextButton(onPressed: (){}, child: Text("需要帮助")),
                  TextButton(onPressed: (){}, child: Text("隐私政策")),
                  TextButton(onPressed: (){}, child: Text("兑换会员")),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
