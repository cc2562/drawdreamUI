import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class editLora extends StatefulWidget {
  const editLora({super.key});

  @override
  State<editLora> createState() => _editLoraState();
}

class _editLoraState extends State<editLora> {
  double nowValue=0.8;
  TextEditingController valueControl = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    valueControl.text = nowValue.toString();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.w,
      height: 25.h,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text("权重设置"),
          actions: [
            IconButton(onPressed: (){
              Navigator.pop(context);
            }, icon: Icon(Iconsax.close_circle))
          ],
        ),
        body: Container(
          padding: EdgeInsets.fromLTRB(3.w, 0, 3.w, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Flex(
                  direction: Axis.horizontal,
                  children: [
                    Text("权重"),
                    Expanded(
                        flex: 5,
                        child: SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                              activeTickMarkColor: Colors.transparent,
                              inactiveTickMarkColor: Colors.transparent,
                              inactiveTrackColor: Theme.of(context).focusColor.withOpacity(0.1)
                          ),
                          child: Slider(
                            value: nowValue,
                            min: 0,
                            max: 3,
                            divisions: 30,
                            label: nowValue.toStringAsFixed(1),
                            onChanged: (value){
                              setState(() {
                                nowValue=value;
                                valueControl.text =nowValue.toStringAsFixed(1);
                              });
                            },
                          ),
                        )
                    ),
                    Expanded(
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Theme.of(context).focusColor.withOpacity(0.1),
                        ),
                        child: TextField(
                          enabled: false,
                          controller: valueControl,
                          decoration: InputDecoration(
                            hintText: nowValue.toStringAsFixed(1),
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(horizontal: 15),
                          ),
                          onChanged: (value){
                            setState(() {
                              nowValue=double.parse(value);
                            });
                          },
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 3.h,),
              ElevatedButton(onPressed: (){}, child: Text("删除此Lora"))
            ],
          ),
        ),
      ),
    );
  }
}
