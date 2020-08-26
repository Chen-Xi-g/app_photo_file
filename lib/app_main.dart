import 'package:app_photo_file/pages/star.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'file:///F:/AndroidProject/app_photo_file/lib/pages/sms.dart';

import 'main.dart';

void main() {
  runApp(AppMainPageView());
}

//有PageView滑动效果
class AppMainPageView extends StatefulWidget {
  @override
  _AppMainPageViewState createState() => _AppMainPageViewState();
}

class _AppMainPageViewState extends State<AppMainPageView> {
  ///  定义首页常量
  //底部标题
  final bottomBarTitle = ["首页", "短信", "收藏"];

  //底部Icon
  final bottomBarIcon = [Icons.home, Icons.message, Icons.star];

  //页面Page
  final pageViewList = [new MyApp(), new Sms(), new Star()];

  //选中和未选中颜色
  final tabTextStyleSelected = TextStyle(color: const Color(0xff3B9AFF));
  final tabTextStyleNormal = TextStyle(color: const Color(0xff969696));

  final _pageController = PageController();

  //当前下标
  int _tabIndex = 0;

  /// 动态返回当前索引布局
  Widget _pageView() {
    return pageViewList[_tabIndex];
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "PageView Demo",
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(bottomBarTitle[_tabIndex]),
        ),
        body: PageView.builder(
          //使用PageView作为容器,和ViewPager相似
          itemBuilder: (context, index) {
            _tabIndex = index;
            return Center(
              child: _pageView(), //加载PageView中的布局
            );
          },
          itemCount: pageViewList.length, //PageView 页数
          onPageChanged: (int index) {
            //PageView发生改变
            setState(() {
              _tabIndex = index;
            });
          },
          controller: _pageController, //PageView 的控制器
        ),
        bottomNavigationBar: BottomNavigationBar(
            items: [
              BottomNavigationBarItem(
                icon: Icon(bottomBarIcon[0]),
                title: Text(bottomBarTitle[0]),
              ),
              BottomNavigationBarItem(
                  icon: Icon(bottomBarIcon[1]), title: Text(bottomBarTitle[1])),
              BottomNavigationBarItem(
                icon: Icon(bottomBarIcon[2]),
                title: Text(bottomBarTitle[2]),
              )
            ],
            selectedItemColor: tabTextStyleSelected.color,
            currentIndex: _tabIndex,
            onTap: (int index) {
              setState(() {
                _tabIndex = index;
              });
              if (_pageController.hasClients) {
                //使用动画切换PageView
                _pageController.animateToPage(_tabIndex,
                    duration: Duration(milliseconds: 500),
                    curve: Curves.easeInOut);
                //不使用动画切换PageView
//              _pageController.jumpToPage(_tabIndex);
              }
            }),
      ),
    );
  }
}

///--------------------------------------------------------------
//无PageView滑动效果
class AppMain extends StatefulWidget {
  @override
  _AppMainState createState() => _AppMainState();
}

class _AppMainState extends State<AppMain> {
  ///  定义首页常量
  //底部标题
  final bottomBarTitle = ["首页", "短信", "收藏"];

  //底部Icon
  final bottomBarIcon = [Icons.home, Icons.message, Icons.star];

  //选中和未选中颜色
  final tabTextStyleSelected = TextStyle(color: const Color(0xff3B9AFF));
  final tabTextStyleNormal = TextStyle(color: const Color(0xff969696));

  //当前下标
  int _tabIndex = 0;

  var _body; //
  var pages; //所有页面

  @override
  void initState() {
    super.initState();
    pages = [App(), Sms(), Star()];
  }

  @override
  Widget build(BuildContext context) {
    _body = IndexedStack(
      children: pages,
      index: _tabIndex,
    );
    return MaterialApp(
      title: "测试APP",
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("这是测试APP"),
        ),
        body: _body,
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: Icon(bottomBarIcon[0]),
              title: Text(bottomBarTitle[0]),
            ),
            BottomNavigationBarItem(
                icon: Icon(bottomBarIcon[1]), title: Text(bottomBarTitle[1])),
            BottomNavigationBarItem(
              icon: Icon(bottomBarIcon[2]),
              title: Text(bottomBarTitle[2]),
            )
          ],
          selectedItemColor: tabTextStyleSelected.color,
          currentIndex: _tabIndex,
          onTap: (int index) {
            setState(() {
              _tabIndex = index;
            });
          },
        ),
      ),
    );
  }
}
