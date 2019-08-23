import 'package:flutter/material.dart';

import 'login/login.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

//如何使用AnimatedWidget助手类（而不是addListener()和setState()）来给widget添加动画
class LogoAnimated extends AnimatedWidget {
  LogoAnimated({Key key, Animation<double> animation})
      : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    final Animation<double> animation = listenable;
    return Scaffold(
      body: Container(
          margin: EdgeInsets.only(top: animation.value),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center, //主轴居中显示
            children: <Widget>[
              Text("YOOZ",
                  style: TextStyle(color: Colors.black, fontSize: 46.0)),
            ],
          )),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

//创建一个位移的动画 Y轴移动的
class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> animation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
        duration: const Duration(milliseconds: 2000),
        vsync: this); //vsync防止屏幕外动画 动画不在屏幕内时 节省资源
    //tween 实际是 Animatable，，，，，tween.animation 实际是 Animation
    animation = new Tween(begin: 100.0, end: 300.0).animate(controller)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          //动画完成进入下一个页面
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return LoginPager();
          },maintainState: false)
          );
        }
      });
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return new LogoAnimated(animation: animation);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
