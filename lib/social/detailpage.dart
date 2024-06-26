import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../Widget/textcontent.dart';

class detailPage extends StatefulWidget {
  const detailPage({super.key});

  @override
  State<detailPage> createState() => _detailPageState();
}

class _detailPageState extends State<detailPage> {
  var imgWidth = 1;
  var imgHeight =1;
  int imgNum =2;
  List imgList =["https://images.tusiassets.com/community/images/720624387631504586/81819fa6da8055e9af1fabc253958273.png!mfit_w2048_h2048_jpg","https://images.tusiassets.com/community/images/720624387631504586/efddea53ac0baa784188dd55246b6f67.png!mfit_w2048_h2048_jpg"];
  Future<void> GetImageSize() async {
    Image image = Image.network("https://images.tusiassets.com/community/images/720624387631504586/81819fa6da8055e9af1fabc253958273.png!mfit_w2048_h2048_jpg");
    image.image
        .resolve(new ImageConfiguration())
        .addListener(ImageStreamListener(
          (ImageInfo info, bool _) {
        imgWidth=info.image.width;
        imgHeight = info.image.height;
        print("Is"+imgWidth.toString()+"www"+imgHeight.toString());
        setState(() {
          imgWidth=info.image.width;
          imgHeight = info.image.height;
        });
      },
    ));
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    GetImageSize();

  }
  Widget showImgae(int index){
    return  AspectRatio(
      aspectRatio: imgWidth/imgHeight,
      child: Container(
        padding: EdgeInsets.all(2.w),
        alignment: Alignment.bottomRight,
        width: 100.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(0),
          image: DecorationImage(
              image: NetworkImage(imgList[index]),
              fit: BoxFit.cover
          ),
        ),
        child: Text((index+1).toString()+"/"+imgNum.toString(),style: TextStyle(
          shadows: [
            Shadow(
              offset: const Offset(0, 0),
              blurRadius: 5.0,
              color: Colors.black.withOpacity(0.5),
            )
          ],
        ),),
      ),
    );
  }
  @override


  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          margin: EdgeInsets.fromLTRB(0, 1.w, 0, 1.w),
          child: Flex(
            direction: Axis.horizontal,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ClipOval(
                child: Container(
                  child: Image(
                    image: NetworkImage("https://pic.bizhi66.com/pic/1375a7df8cc9c9a23b56e4d05178d85c"),
                    height: 9.w,
                    width: 9.w,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(width: 3.w,),
              Expanded(
                child: Text("CC米饭的米饭",style: TextStyle(fontSize: 16.sp),),
              ),
              TextButton(onPressed: (){}, child: Text("关注")),
            ],
          ),
        ),
      ),
      bottomSheet: Container(
        width: 100.w,
        height: 6.h,
        color: Theme.of(context).bottomSheetTheme.backgroundColor,
        child: Flex(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          direction: Axis.horizontal,
          children: [
            Expanded(
              flex: 5,
                child:TextButton(
                  onPressed: () {  },
                  child: Text("做同款"),
                )
            ),
            Expanded(child: IconButton(icon: Icon(Iconsax.heart), onPressed: () {  },)),
            Expanded(child: IconButton(icon: Icon(Iconsax.star), onPressed: () {  },)),
          ],
        ),
      ),
      body: Container(
        width: 100.w,
        child: ListView(
          children: [
            GestureDetector(
              onLongPress: (){
                showDialog(context: context,
                    builder: (context){
                  return SimpleDialog(
                    children: [
                      SimpleDialogOption(
                        child: Text("保存图片"),
                        onPressed: (){}
                      ),
                      SimpleDialogOption(
                        child: Text("举报"),
                          onPressed: (){}
                      )
                    ],
                  );
                    });
              },
              child: Container(
                width: 100.w,
                child: AspectRatio(
                  aspectRatio: imgWidth/imgHeight,
                  child: Container(
                    width: 100.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      //color: Colors.red,
                    ),
                    child: PageView.builder(
                      itemCount: imgNum,
                      itemBuilder: (BuildContext context, int index) {
                        return showImgae(index);
                      },
                    ),
                  ),
                ),
              ),
            ),
            Padding(padding: EdgeInsets.fromLTRB(3.w, 1.h, 3.w,0),
            child: Text("超级不错的一次分享",style: TextStyle(fontSize: 18.sp,fontWeight: FontWeight.w500),),
            ),
            Padding(padding: EdgeInsets.fromLTRB(3.w, 0.5.h, 3.w, 1.h),
              child: Text("超级不错的一次分享\n尝试了很多次终于得到了满意的图片\n我的技巧：多用滤镜，然后调整对比度，亮度，饱和度，色温，对比度，亮度，饱和度，色温，对比度，亮度，饱和度，色温，对比度，亮度，饱和度，色温，对比度，亮度，饱和度，色温，对比度，亮度，饱和度，色温，对比度，亮度，饱和度，色温，对比度，亮度，饱和度，色温。",style: TextStyle(fontWeight: FontWeight.w500),),
            ),
            Padding(padding: EdgeInsets.fromLTRB(3.w, 1.h, 3.w,0),
              child: Text("2024-06-03",style: TextStyle(color: Colors.grey),),
            ),
            Divider(
              color: Colors.grey.withOpacity(0.1),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(3.w, 0, 3.w, 0),
              child: TextContent("提示词"),
            ),
            Container(
              padding: EdgeInsets.all(2.w),
              margin: EdgeInsets.fromLTRB(3.w, 0, 3.w, 0),
              width: 100.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Theme.of(context).highlightColor.withOpacity(0.1),
              ),
              child: Text("Upwardly upturned bangs, knee length large wavy curly hair, center cut bangs, center cut hairstyle, with a green bow on the head, headband, bow, brown hair, red green eyes, different pupils, two eyes of different colors, one red and one green, formal dress, rose garden"),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(3.w, 0, 3.w, 0),
              child: TextContent("负面提示词"),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(3.w, 0, 3.w, 0),
              padding: EdgeInsets.all(2.w),
              width: 100.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Theme.of(context).highlightColor.withOpacity(0.1),
              ),
              child: Text("Upwardly upturned bangs, knee length large wavy curly hair, center cut bangs, center cut hairstyle, with a green bow on the head, headband, bow, brown hair, red green eyes, different pupils, two eyes of different colors, one red and one green, formal dress, rose garden"),
            ),
            SizedBox(height: 3.w,),
            Container(
              margin: EdgeInsets.fromLTRB(3.w, 0, 3.w, 0),
              padding: EdgeInsets.all(2.w),
              width: 100.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Theme.of(context).highlightColor.withOpacity(0.1),
              ),
              child: ListView(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                children: [
                  ListTile(
                    title: Text("大模型"),
                    subtitle: Text("自然调和------二次元动漫"),
                  ),
                  ListTile(
                    title: Text("LORA"),
                    subtitle: Text("光影优化 - beta1,blueMix（动漫混合画风） - beta,水润Renalith(二次元通用优化Mix) - V4.5"),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10.h,),
          ],
        ),
      ),
    );
  }
}
