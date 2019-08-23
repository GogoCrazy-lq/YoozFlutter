import 'package:flutter/material.dart';
import 'package:yoozflutter_mendian/store/cell/ItemCell.dart';
import 'package:yoozflutter_mendian/utils/ToastUtils.dart';

class YooZStorePager extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 16.0, top: 80.0, right: 16.0, bottom: 16.0),
                child: Flex(
                  direction: Axis.horizontal,
                  children: <Widget>[
                    Stack(
                      children: <Widget>[
                        new DecoratedBox(
                          decoration: BoxDecoration(
                              border: BoxBorder.lerp(
                                  Border.all(
                                      color: Colors.blue,
                                      width: 1,
                                      style: BorderStyle.solid),
                                  Border.all(
                                      color: Colors.blue,
                                      width: 1,
                                      style: BorderStyle.solid),
                                  1),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30.0))),
                          child: SizedBox(
                            width: 62.0,
                            height: 62.0,
                            child: new ClipOval(
                              child: new FadeInImage.assetNetwork(
                                placeholder: 'assets/images/store_user.png',
                                image: 'assets/images/store_user.png',
                                width: 60.0,
                                height: 60.0,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Expanded(
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 16.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                '天津市和平区测试直营店',
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 24.0,
                                    fontWeight: FontWeight.bold),
                              ),
                              Container(
                                margin: const EdgeInsets.only(top: 8.0),
                                child: Text(
                                  '直营店',
                                  style: TextStyle(
                                      fontSize: 14.0,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Container(
                                  margin: const EdgeInsets.only(top: 6.0),
                                  child: Wrap(
                                    children: <Widget>[
                                      Text(
                                        '北京市朝阳区建国门西大望路佳兆业广场北塔1801',
                                        style: TextStyle(
                                            fontSize: 14.0, color: Colors.grey),
                                      )
                                    ],
                                  )),
                            ],
                          ),
                        ))
                  ],
                ),
              ),
            ),
            createCell('商品库存', 1.0),
            createCell('商品入库单', 1.0),
            createCell('门店成本', 10.0),
            createCell('毛利', 1.0),
            createCell('设置', 10.0),
          ],
        ),
      ),
    ));
  }

  Widget createCell(String title, double top) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 1000),
      margin: EdgeInsets.only(top: top),
      child: new Material(
        color: Colors.white,
        child: InkWell(
          onTap: () {
            showToast("呱呱呱。。。");
          },
          child: new ItemCell(leftContent: title),
        ),
      ),
    );
  }
}
