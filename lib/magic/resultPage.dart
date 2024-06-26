import 'package:drawdream/social/newpost.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../Widget/textcontent.dart';

class resultPage extends StatefulWidget {
  const resultPage({super.key});

  @override
  State<resultPage> createState() => _resultPageState();
}

class _resultPageState extends State<resultPage> {
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
          borderRadius: BorderRadius.circular(15),
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
        actions: [
          IconButton(onPressed: (){
            showCupertinoModalBottomSheet(
              expand: false,
              context: context,
              enableDrag: true,
              isDismissible: true,
              builder: (context) => newPostPage(),
            );
          }, icon: Icon(Iconsax.send_2))
        ],
      ),
      bottomSheet: Container(
        padding: EdgeInsets.fromLTRB(3.w, 3.w, 3.w, 2.w),
        width: 100.w,
        height: 10.h,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(0)
        ),
        child: Flex(direction: Axis.horizontal,
          children: [
           Expanded(child:  ElevatedButton(
             style: ElevatedButton.styleFrom(
               foregroundColor: Colors.white, backgroundColor:Theme.of(context).highlightColor.withOpacity(0.1),
               //change text color of button
               shape: RoundedRectangleBorder(
                 borderRadius: BorderRadius.circular(25),
               ),
             ),
             onPressed: (){
               Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const resultPage()));
             },
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.center,
               mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 Icon(Iconsax.document_download),
                 SizedBox(height: 1.w,),
                 Text("保存")
               ],
             ),
           ),),
            SizedBox(width: 1.w),
            Expanded(child:  ElevatedButton(
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white, backgroundColor:Theme.of(context).highlightColor.withOpacity(0.1),
                //change text color of button
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
              onPressed: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const resultPage()));
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.hd_outlined),
                  SizedBox(height: 1.w,),
                  Text("放大")
                ],
              ),
            ),),
            SizedBox(width: 1.w),
            Expanded(child:  ElevatedButton(
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white, backgroundColor:Theme.of(context).highlightColor.withOpacity(0.1),
                //change text color of button
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
              onPressed: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const resultPage()));
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Iconsax.edit_2),
                  SizedBox(height: 1.w,),
                  Text("再次编辑")
                ],
              ),
            ),),
          ],
        ),
      ),
      body: Container(
        margin: EdgeInsets.fromLTRB(3.w, 0, 3.w, 1.h),
        child: ListView(
          children: [
            Container(
              padding: EdgeInsets.all(2.w),
              width: 100.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.red.withOpacity(0.1),
              ),
              child: Text("请及时下载图片，未发布到社区的图片将在13天后删除"),
            ),
            SizedBox(height: 1.w,),
            Container(
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
            TextContent("提示词"),
            Container(
              padding: EdgeInsets.all(2.w),
              width: 100.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Theme.of(context).highlightColor.withOpacity(0.1),
              ),
              child: Text("Upwardly upturned bangs, knee length large wavy curly hair, center cut bangs, center cut hairstyle, with a green bow on the head, headband, bow, brown hair, red green eyes, different pupils, two eyes of different colors, one red and one green, formal dress, rose garden"),
            ),
            TextContent("负面提示词"),
            Container(
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
