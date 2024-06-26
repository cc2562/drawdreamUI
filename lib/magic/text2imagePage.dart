import 'package:cached_network_image/cached_network_image.dart';
import 'package:drawdream/Widget/card.dart';
import 'package:drawdream/Widget/textcontent.dart';
import 'package:drawdream/magic/editLora.dart';
import 'package:drawdream/magic/resultPage.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
class text2ImagePage extends StatefulWidget {
  const text2ImagePage({super.key});

  @override
  State<text2ImagePage> createState() => _text2ImagePageState();
}

class _text2ImagePageState extends State<text2ImagePage> {
  bool isChinese = false;
  String selectedSize ='portrait';
  Map BigModelList ={
    0:['645273936655008607','https://images.tusiassets.com/model_showcase/645273936655008607/2725de48-d543-f8e7-6664-6bdfce514a5e.png!mfit_w750_h750_jpg_avif','麦橘写真'],
    1:['1111111','https://images.tusiassets.com/model_showcase/718665865362486041/6490c9ab-6e26-b2dd-ab01-82a8fdf5b43e.png!mfit_w750_h750_jpg_avif','极简美学'],
    2:['22222222','https://images.tusiassets.com/model_showcase/705234665109315265/510a481b-a4d3-6b5e-57f4-1012e857015d.png!mfit_w750_h750_jpg_avif','二次元'],
  };
  int selectedBigModel=0;
  List showBorder=[];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    showBorder.add(true);
    for(int i=1;i<BigModelList.length;i++){
      showBorder.add(false);
    }
    print(showBorder);
  }
  BoxBorder showSelectedBorder(int nowSelected){

    if(showBorder[nowSelected]==true) {
      return Border.all(color: Color(0xff8E7AB5), width: 0.8.w);
    }else{
      return Border.all(color: Color(0xff8E7AB5), width: 0.w);
    }
  }

  void ChangeSelectedModel(int nowSelected){
    setState(() {
      showBorder[selectedBigModel]=false;
      showBorder[nowSelected]=true;
    });
    selectedBigModel = nowSelected;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: Container(
        padding: EdgeInsets.fromLTRB(3.w, 3.w, 3.w, 1.w),
        width: 100.w,
        height: 10.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(0)
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text("预计消耗:4魔力值"),
            Container(
              width: 100.w,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white, backgroundColor: Color(0xff8E7AB5),
                  //change text color of button
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
                onPressed: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const resultPage()));
                },
                child: Text("开始创作"),
              ),
            )
          ],
        ),
      ),
      appBar: AppBar(
        title: Text("文生图"),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.help_outline_outlined))
        ],
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(3.w, 0, 3.w, 0),
        child: ListView(
          children: [
            TextContent("提示词"),
            Container(
              padding: EdgeInsets.all(2.w),
              width: 100.w,
              height: 15.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Theme.of(context).highlightColor.withOpacity(0.1),
              ),
              child: TextField(
                onChanged: (String str) {
                  RegExp exp = RegExp(r"[\u4e00-\u9fa5]");
                  if (exp.hasMatch(str)) {
                    if (isChinese == false) {
                      setState(() {
                        isChinese = true;
                      });
                    }
                    print("中文");
                  } else {
                    if (isChinese == true) {
                      setState(() {
                        isChinese = false;
                      });
                    }
                  }
                },
                maxLines: 4,
                maxLength: 360,
                decoration: InputDecoration(
                  hintText: "输入创意吧~用,分割",
                  border: InputBorder.none,
                ),
              ),
            ),
            SizedBox(
              height: 1.h,
            ),
            Visibility(
                visible: isChinese,
                child: CardWidget(
                    context,
                    Center(
                      child: Text("检测到输入了中文提示词，生成时将自动翻译为英文"),
                    ),
                    100.w,
                    5.h)),
            TextContent("大模型"),
            Container(
                padding: EdgeInsets.all(2.w),
                width: 100.w,
                // /height: 15.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Theme.of(context).highlightColor.withOpacity(0.1),
                ),
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    childAspectRatio: 1,
                  ),
                  itemCount: BigModelList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      child: CachedNetworkImage(
                        imageUrl: BigModelList[index][1],
                        imageBuilder: (context, imageProvider) => Container(
                          margin: EdgeInsets.fromLTRB(1.w, 0, 1.w, 0),
                          padding: EdgeInsets.fromLTRB(0, 0, 0, 1.w),
                          height: 12.h,
                          width: 12.h,
                          decoration: BoxDecoration(
                              border: showSelectedBorder(index),
                              borderRadius: BorderRadius.circular(15),
                              color: Theme.of(context).highlightColor.withOpacity(0.1),
                              image: DecorationImage(
                                image: NetworkImage(
                                    BigModelList[index][1]),
                                fit: BoxFit.cover,
                              )),
                          alignment: Alignment.bottomCenter,
                          child: Text(BigModelList[index][2],
                            style: TextStyle(
                              shadows: [
                                Shadow(
                                  offset: const Offset(0, 0),
                                  blurRadius: 5.0,
                                  color: Colors.black.withOpacity(0.5),
                                )
                              ],
                            ),
                          ),
                        ),
                        placeholder: (context, url) => Container(
                          margin: EdgeInsets.fromLTRB(1.w, 0, 1.w, 0),
                          padding: EdgeInsets.fromLTRB(0, 0, 0, 1.w),
                          height: 12.h,
                          width: 12.h,
                          decoration: BoxDecoration(
                              border: showSelectedBorder(index),
                              borderRadius: BorderRadius.circular(15),
                              color: Theme.of(context).highlightColor.withOpacity(0.1),),
                          alignment: Alignment.bottomCenter,
                          child: Text(BigModelList[index][2],
                            style: TextStyle(
                              shadows: [
                                Shadow(
                                  offset: const Offset(0, 0),
                                  blurRadius: 5.0,
                                  color: Colors.black.withOpacity(0.5),
                                )
                              ],
                            ),
                          ),
                        ),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                      ),
                      onTap: (){
                        ChangeSelectedModel(index);
                      },
                    );

                  },
                )),
            TextContent("风格叠加（LORA）"),
            Container(
                padding: EdgeInsets.all(2.w),
                width: 100.w,
                // /height: 15.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Theme.of(context).highlightColor.withOpacity(0.1),
                ),
                child: GridView(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    childAspectRatio: 1,
                  ),
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(1.w, 0, 1.w, 0),
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 1.w),
                      height: 12.h,
                      width: 12.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color:
                          Theme.of(context).highlightColor.withOpacity(0.1),),
                      alignment: Alignment.bottomCenter,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Iconsax.add),
                        ],
                      ),
                    ),
                    CachedNetworkImage(
                      imageUrl: "https://images.tusiassets.com/model_showcase/645273936655008607/2725de48-d543-f8e7-6664-6bdfce514a5e.png!mfit_w750_h750_jpg_avif",
                      imageBuilder: (context,imgpr){
                        return Container(
                          margin: EdgeInsets.fromLTRB(1.w, 0, 1.w, 0),
                          padding: EdgeInsets.fromLTRB(0, 0, 0, 1.w),
                          height: 12.h,
                          width: 12.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Theme.of(context).highlightColor.withOpacity(0.1),
                            image: DecorationImage(
                              image: imgpr,
                              fit: BoxFit.cover
                            )
                          ),
                          alignment: Alignment.bottomCenter,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(onPressed: (){
                                showCupertinoModalBottomSheet(
                                  expand: false,
                                  context: context,
                                  enableDrag: true,
                                  isDismissible: true,
                                  builder: (context) => editLora(),
                                );
                              }, icon: Icon(Iconsax.edit_2),
                              ),
                              Text("0.8",
                                style: TextStyle(
                                  shadows: [
                                    Shadow(
                                      offset: const Offset(0, 0),
                                      blurRadius: 5.0,
                                    )
                                  ],
                                ),
                              ),
                              Text("细节添加",
                                style: TextStyle(
                                  shadows: [
                                    Shadow(
                                      offset: const Offset(0, 0),
                                      blurRadius: 5.0,
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                )),
            SizedBox(height:3.w),
            Container(
                padding: EdgeInsets.all(1.w),
                width: 100.w,
                // /height: 15.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Theme.of(context).highlightColor.withOpacity(0.1),
                ),
                child: ListTile(
                  title: Text("尺寸"),
                  trailing: DropdownButton(
                    value: selectedSize,
                    hint: Text('请选择一个选项'),
                    items: [
                      DropdownMenuItem(
                        value: 'portrait',
                        child: Text('2:3肖像画'),
                      ),
                      DropdownMenuItem(
                        value: 'landscape',
                        child: Text('3:2风景画'),
                      ),
                      DropdownMenuItem(
                        value: 'square',
                        child: Text('1:1头像'),
                      ),
                    ],
                    onChanged: (value) {
                      print('选中的值: $value');
                      setState(() {
                        selectedSize =value!;
                      });
                    },
                  ),
                )),
            SizedBox(height:3.w),
            Container(
                padding: EdgeInsets.all(1.w),
                width: 100.w,
                // /height: 15.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Theme.of(context).highlightColor.withOpacity(0.1),
                ),
                child: Column(
                  children: [
                    ListTile(
                      title: Text("参考照片"),
                    ),
                    Container(
                      padding: EdgeInsets.all(1.w),
                      margin: EdgeInsets.all(1.w),
                      width: 100.w,
                      height: 15.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Theme.of(context).highlightColor.withOpacity(0.1),
                      ),
                      child: Stack(
                        children: [
                          Container(
                            width: 100.w,
                            height: 15.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                              )
                          ),
                          Center(
                            child: IconButton(
                              onPressed: (){},
                              icon: Icon(Iconsax.add_circle),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
            ),
            SizedBox(height: 15.h,)
          ],
        ),
      ),
    );
  }
}
