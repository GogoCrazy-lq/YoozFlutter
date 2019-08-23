import 'package:flutter/material.dart';
import 'package:yoozflutter_mendian/home/home.dart';
import 'package:yoozflutter_mendian/manage/manage.dart';
import 'package:yoozflutter_mendian/order/order.dart';
import 'package:yoozflutter_mendian/store/store.dart';

class MainPager extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: new MainPagerWidget(),
    );
  }
}

class MainPagerWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new PagerState();
  }
}

class PagerState extends State<MainPagerWidget> {
  int _tabIndex = 0;
  var tabImages;
  var appBarTitle = ['首页', '会员管理', '订单列表', '门店中心'];
  var pagerList;

  @override
  void initState() {
    super.initState();
    pagerList = [
      new YooZHomePager(),
      new YooZManagePager(),
      new YooZOrderPager(),
      new YooZStorePager()
    ];
  }

  @override
  Widget build(BuildContext context) {
    initIcon();
    return Scaffold(
      body: Container(
        child: pagerList[_tabIndex],
      ), //内容
      bottomNavigationBar: new BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          new BottomNavigationBarItem(
              icon: getTabIcon(0), title: getTabTitle(0)),
          new BottomNavigationBarItem(
              icon: getTabIcon(1), title: getTabTitle(1)),
          new BottomNavigationBarItem(
              icon: getTabIcon(2), title: getTabTitle(2)),
          new BottomNavigationBarItem(
              icon: getTabIcon(3), title: getTabTitle(3)),
        ],
        currentIndex: _tabIndex,
        iconSize: 24.0,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() { //刷新
            _tabIndex = index;
          });
        },
      ),
    );
  }

  initIcon() {
    tabImages = [
      [
        getTabImage('assets/images/tab_home_selected.png'),
        getTabImage('assets/images/tab_home_default.png')
      ],
      [
        getTabImage('assets/images/tab_management_selected.png'),
        getTabImage('assets/images/tab_management_default.png')
      ],
      [
        getTabImage('assets/images/tab_marketing_selected.png'),
        getTabImage('assets/images/tab_marketing_default.png')
      ],
      [
        getTabImage('assets/images/tab_store_selected.png'),
        getTabImage('assets/images/tab_store_default.png')
      ]
    ];
  }

  Image getTabImage(String path) {
    return Image.asset(path, width: 24.0, height: 24.0);
  }

  Image getTabIcon(int index) {
    if (index == _tabIndex) {
      return tabImages[index][0];
    } else {
      return tabImages[index][1];
    }
  }

  Text getTabTitle(int index) {
    if (index == _tabIndex) {
      return new Text(
        appBarTitle[index],
        style: TextStyle(fontSize: 14.0, color: Colors.blue),
      );
    } else {
      return new Text(
        appBarTitle[index],
        style: TextStyle(fontSize: 14.0, color: Colors.grey),
      );
    }
  }
}
