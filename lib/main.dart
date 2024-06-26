import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:drawdream/mainPage/newhome.dart';
import 'package:drawdream/mainPage/magicPage.dart';
import 'package:drawdream/mainPage/userPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dropdown_alert/dropdown_alert.dart';
import 'package:iconsax/iconsax.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context, orientation, screenType) {
        return MaterialApp(
          builder: (context, child) => Stack(
            children: [
              child!,
              DropdownAlert()
            ],
          ),
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.dark(),
            useMaterial3: true,
          ),
          home: const MyHomePage(title: 'Flutter Demo Home Page'),
        );
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with AutomaticKeepAliveClientMixin {
  PageController homePageViewControl = PageController();
  int currentPage=0;
  List<String> appBarTitle=["首页","魔法屋","我的"]; // 顶部导航栏标题
  @override
  void initState() {
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      extendBody: true,
      extendBodyBehindAppBar: true,
      bottomNavigationBar: DotNavigationBar(
        backgroundColor: Theme.of(context).cardColor,
        currentIndex: currentPage,
        onTap: (index){
          homePageViewControl.jumpToPage(index);
          setState(() {
            currentPage =index;
          });
        },
        marginR: const EdgeInsets.symmetric(vertical: 0, horizontal: 8),
        paddingR: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
        boxShadow: [
          BoxShadow(
            color: Colors.purple.withOpacity(0.1),
            spreadRadius: 3,
            blurRadius: 3,
            offset: Offset(0, 0), // 阴影在右下方
          ),
        ],
        enableFloatingNavBar: true,
        items: [
          /// Home
          DotNavigationBarItem(
            icon: Icon(Iconsax.home),
            selectedColor: Colors.purple,
          ),

          /// Likes
          DotNavigationBarItem(
            icon: Icon(Iconsax.discover),
            selectedColor: Colors.pink,
          ),

          /// Profile
          DotNavigationBarItem(
            icon: Icon(Iconsax.user),
            selectedColor: Colors.teal,
          ),
        ],
      ),
      body: PageView(
        physics: new NeverScrollableScrollPhysics(),
        controller: homePageViewControl,
        children: [
          homePage(),
          magicPage(),
          userPage()
        ],
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
