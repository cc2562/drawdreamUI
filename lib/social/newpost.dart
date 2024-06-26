import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class newPostPage extends StatefulWidget {
  const newPostPage({super.key});

  @override
  State<newPostPage> createState() => _newPostPageState();
}

class _newPostPageState extends State<newPostPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("分享到社区"),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(onPressed: (){
            Navigator.pop(context);
          }, icon: Icon(Iconsax.close_circle))
        ],
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(3.w, 1.h, 3.w, 0),
        child: ListView(
          children: [
            Container(
              height: 10.h,
              width: 100.w,
              child:ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Container(
                    alignment: Alignment.bottomLeft,
                    width: 10.h,
                    height:10.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      image: DecorationImage(
                        image: NetworkImage("https://images.tusiassets.com/community/images/720624387631504586/81819fa6da8055e9af1fabc253958273.png!mfit_w2048_h2048_jpg"),
                        fit: BoxFit.cover
                      )
                    ),
                    child: Checkbox(
                      value: true,
                      onChanged: (value){
                        setState(() {
                          value = value;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 2.h,),
            Container(
              padding: EdgeInsets.fromLTRB(2.w, 1.w, 2.w, 1.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Theme.of(context).focusColor.withOpacity(0.1)
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "输入作品名",
                  border: InputBorder.none,
                ),
              ),
            ),
            SizedBox(height: 2.h,),
            Container(
              padding: EdgeInsets.fromLTRB(2.w, 1.w, 2.w, 1.w),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Theme.of(context).focusColor.withOpacity(0.1)
              ),
              child: TextField(
                maxLines: 5,
                decoration: InputDecoration(
                  hintText: "输入介绍",
                  border: InputBorder.none,
                ),
              ),
            ),
            SizedBox(height: 2.h,),
            ElevatedButton(onPressed: (){}, child: Text("发布")),
            SizedBox(height: 2.h,),
            Text("发布到社区后将允许其他用户制作同款作品\n并参与社区创作")
          ],
        ),
      ),
    );
  }
}
