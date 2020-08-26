import 'package:app_photo_file/util/image_helper.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() {
  runApp(MyApp());
}

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  /// 初始化
  @override
  void initState() {
    super.initState();
  }

  /// 第三方依赖的Toast提示
  /// Github地址:https://github.com/ponnamkarthik/FlutterToast
  void _showToast(int index) {
    setState(() {
      Fluttertoast.showToast(
          msg: "This is Center Short Toast",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 2,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0,
          webBgColor: "linear-gradient(to right, #FF0033, #FF00CC)",
          webPosition: "center",
          webShowClose: true);
    });
  }

  /// 使用Image工具类调用Assets目录下的Jpg图片
  /// 每次新增图片需要到 ./pubspec.yaml中配置
  Widget img = ImageHelper.iconJpg("banner", boxFit: BoxFit.cover);

  //判断当前头部图片
  bool isBanner = true;

  // 选择当前图片
  void _switchImg(String name, String type) {
    setState(() {
      if (type == "jpg")
        img = ImageHelper.iconJpg(name, boxFit: BoxFit.cover);
      else
        img = ImageHelper.iconPng(name, boxFit: BoxFit.cover);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          //设置AppBar样式
          centerTitle: true, //标题是否居中
          title: Text("这是第二个Demo"), //标题
          leading: Switch(
              //在左上角添加切换按钮
              value: isBanner, //当前状态
              activeColor: Colors.red, //选中颜色
              activeTrackColor: Colors.red, //横条选中颜色
              onChanged: (bool val) {
                //状态发生改变
                isBanner = !isBanner;
                _switchImg(val ? "banner" : "banner2", "jpg");
              })),
      body: _buildListView(),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          _bottomNavigationBarItem(context, Icons.home, "首页"),
          _bottomNavigationBarItem(context, Icons.message, "短信"),
          _bottomNavigationBarItem(context, Icons.star, "收藏")
        ],
        onTap: (index) {
          _showToast(index);
        },
      ),
    );
  }

  /// ListView 主页面
  ListView _buildListView() {
    return ListView(
      //使用ListView加载主页布局
      children: <Widget>[
        AnimatedSwitcher(
          //使用切换动画
          duration: Duration(seconds: 3),
          transitionBuilder: (child, animation) {
            return ScaleTransition(
              child: child,
              scale: animation,
            );
          },
          child: img,
        ),
        Container(
          //第二个布局
          padding: EdgeInsets.only(top: 32.0, left: 32.0, right: 32.0),
          child: Row(
            children: <Widget>[
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                        padding: EdgeInsets.only(bottom: 8.0), //设置底边距
                        child: Text("这是一个标题",
                            style: TextStyle(fontWeight: FontWeight.bold))),
                    //字体加粗
                    Text(
                      "这是副标题",
                      style: TextStyle(color: Colors.grey[500]), //灰色值500
                    )
                  ],
                ),
              ),
              Icon(
                Icons.star,
                color: Colors.red,
              ),
              Text("1")
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.all(32.0),
          //多行文本使用三个单引号或双引号
          child: Text('''
          Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese Alps. Situated 1,578 meters above sea level, it is one of the larger Alpine Lakes. A gondola ride from Kandersteg, followed by a half-hour walk through pastures and pine forest, leads you to the lake, which warms to 20 degrees Celsius in the summer. Activities enjoyed here include rowing, and riding the summer toboggan run.
          '''),
        )
      ],
    );
  }

  /// 底部控件布局
  BottomNavigationBarItem _bottomNavigationBarItem(
      BuildContext context, IconData icon, String label) {
    //当前主题颜色
    Color color = Theme.of(context).primaryColor;
    return BottomNavigationBarItem(
      icon: Icon(
        icon,
        color: color,
      ),
      title: Text(
        label,
        style: TextStyle(color: color, fontWeight: FontWeight.w400),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //使用 MaterialApp 加载可变home: App()
    return MaterialApp(title: "这是测试Demo", home: App());
  }
}
