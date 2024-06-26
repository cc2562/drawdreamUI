

import 'dart:async';
import 'dart:io';

import 'package:elegant_notification/elegant_notification.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dropdown_alert/alert_controller.dart';
import 'package:flutter_dropdown_alert/model/data_alert.dart';
import 'package:gt4_flutter_plugin/gt4_enum.dart';
import 'package:gt4_flutter_plugin/gt4_flutter_plugin.dart';
import 'package:gt4_flutter_plugin/gt4_session_configuration.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class loginPage extends StatefulWidget {
  const loginPage({super.key});

  @override
  State<loginPage> createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {
  bool _isCheck = false;
  var config = GT4SessionConfiguration();
  late var captcha ;
  Timer? _timer;
  bool _hasSentOnce = false; // 新增状态变量，记录是否已经发送过验证码
  String phoneNumber="";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    config.userInterfaceStyle = GTC4UserInterfaceStyle.light;
    config.backgroundColor = Colors.black;
    config.debugEnable = false;
    config.logEnable = false;
    config.canceledOnTouchOutside = true;
    config.timeout = 8000;
    config.userInterfaceStyle=GTC4UserInterfaceStyle.dark;
    captcha =Gt4FlutterPlugin("115eb4e42c2da669c1864694f822f01e",config);
  }

  bool _isCountdownActive = false;
  int _countdownSeconds = 60;
  Timer? _countdownTimer;

  void _startCountdown() {
    setState(() {
      _isCountdownActive = true;
      print("开始啦");
    });
    _countdownTimer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_countdownSeconds <= 0) {
        timer.cancel();
        _resetCountdown();
      } else {
        setState(() {
          _countdownSeconds--;
        });
      }
    });
  }

  void _resetCountdown() {
   // _countdownTimer?.cancel();
    setState(() {
      _isCountdownActive = false;
      _countdownSeconds = 60;
    });

  }


  @override


  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("登录/注册"),
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(3.w, 2.h, 3.w, 2.h),
        width: 100.w,
        height: 100.h,
        child: Column(
          children: [
            Text("与魔法签订契约",style: TextStyle(fontSize: 24.sp,fontWeight: FontWeight.bold),),
            SizedBox(height: 1.h,),
            Container(
              width: 100.w,
              padding: EdgeInsets.fromLTRB(2.w, 0, 2.w, 0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Theme.of(context).highlightColor.withOpacity(0.1),
              ),
              child: TextField(
                keyboardType: TextInputType.number,
                style: TextStyle(
                  fontSize: 18.sp
                ),
                maxLength: 22,
                decoration: InputDecoration(
                  hintText: "请输入手机号",
                  border: InputBorder.none,
                  counterText: '',
                ),
                onChanged: (str){
                  phoneNumber = str;
                },
              ),
            ),
            SizedBox(height: 2.h,),
            Container(
              width: 100.w,
              padding: EdgeInsets.fromLTRB(2.w, 0, 2.w, 0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Theme.of(context).highlightColor.withOpacity(0.1),
              ),
              child: Flex(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.end,
                direction: Axis.horizontal,
                children: [
                  Expanded(
                    flex: 1,
                    child:TextField(
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))//设置只允许输入数字
                      ],
                      keyboardType: TextInputType.number,
                      style: TextStyle(
                          fontSize: 18.sp
                      ),
                      maxLength: 6,
                      decoration: InputDecoration(
                        hintText: "请输入验证码",
                        border: InputBorder.none,
                        counterText: '',
                      ),
                    ),
                  ),
                  Expanded(

                    child: TextButton(
                      child: Text(_isCountdownActive ? "$_countdownSeconds 秒后重新发送" : "获取验证码"),
                      onPressed: (){
                        if(phoneNumber.isEmpty){
                          AlertController.show("出错啦", "请输入手机号", TypeAlert.error);
                          return;
                        }
                        RegExp exp = RegExp(
                            r'^((13[0-9])|(14[0-9])|(15[0-9])|(16[0-9])|(17[0-9])|(18[0-9])|(19[0-9]))\d{8}$');
                        bool matched = exp.hasMatch(phoneNumber);
                        if (!matched) {
                          AlertController.show("出错啦", "请输入正确的手机号", TypeAlert.error);
                          return;
                        }
                        if (_hasSentOnce) {
                          // 如果之前已经发送过验证码，则等待60秒后重新发送
                          AlertController.show("出错啦", "请等待$_countdownSeconds秒后重试", TypeAlert.warning);
                          return;
                        }
                        captcha.addEventHandler(
                          onShow: (Map<String, dynamic> message) async {
                            debugPrint("Captcha did show");
                          },
                          onResult: (Map<String, dynamic> message) async {
                            debugPrint("Captcha result: " + message.toString());
                            String status = message["status"];
                            if (status == "1") {
                              setState(() { // 更新状态，表示已经发送过验证码
                                _hasSentOnce = true;
                              });
                              // 验证成功处理逻辑
                              Map result = message["result"] as Map;
                              print("验证成功啦~~~~");
                              AlertController.show("验证码已发送", "请注意查收", TypeAlert.success);
                              if (_timer != null && _timer!.isActive) {
                                _timer!.cancel(); // 取消当前正在进行的计时器
                              }
                              _startCountdown();
                              _timer = Timer(Duration(seconds: 60), () {
                                // 在60秒后执行的逻辑，例如重新发送验证码
                                //captcha.verify();
                                _hasSentOnce =false;
                              });
                            } else {
                              // 错误处理逻辑
                              AlertController.show("出错啦", "请稍后再试试吧", TypeAlert.error);
                            }
                          },
                          onError: (Map<String, dynamic> message) async {
                            debugPrint("Captcha onError: " + message.toString());
                            AlertController.show("出错啦", "错误原因："+message['msg'], TypeAlert.error);
                            // 错误处理逻辑
                          },
                        );
                        captcha.verify();
                      },
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Checkbox(value: _isCheck, onChanged: (v){
                  setState(() {
                    _isCheck = v!;
                    print(_isCheck);
                  });
                }),
                Text("我已阅读并同意"),
                TextButton(
                  child: Text("《用户协议》"),
                  onPressed: (){},
                ),
                Text("和"),
                TextButton(
                  child: Text("《隐私政策》"),
                  onPressed: (){},
                ),
              ],
            ),
            SizedBox(height: 2.h,),
            Container(
              width: 100.w,
              height: 6.h,
              child:ElevatedButton(
                child: Text("登录"),
                onPressed: !_isCheck ? null : () {},
              ),
            )
          ],
        ),
      ),
    );
  }
}
