import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:yoozflutter_mendian/order/cell/OrderStatsCell.dart';

class YooZOrderPager extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text(
          '订单列表',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 16.0),
            child: GestureDetector(
              onTap: () {},
              child: Image.asset(
                'assets/images/order_filter.png',
                width: 18.0,
                height: 18.0,
              ),
            ),
          )
        ],
      ),
      body: Container(
          //列表内容
          color: Color(0xFFECECEC),
          child: new RefreshListView()),
    ));
  }
}

class RefreshListView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return RefreshListViewState();
  }
}

class RefreshListViewState extends State<RefreshListView> {
  RefreshController _refreshController;
  List<String> itemList = ["1", "2", "1", "1", "1"];

  @override
  void initState() {
    super.initState();
    _refreshController = RefreshController(initialRefresh: true);
  }

  @override
  Widget build(BuildContext context) {
    return SmartRefresher(
      controller: _refreshController,
      onRefresh: _onRefresh,
      onLoading: _onLoading,
      child: new ListView.builder(
        itemBuilder: (context, index) {
          //创建items
          return _createListItem();
        },
        itemCount: itemList.length,
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
      ),
    );
  }

  _onRefresh() async {
    await Future.delayed(Duration(milliseconds: 1500)); //等待完成
    itemList.add("11");
    setState(() {});
    _refreshController.refreshCompleted();
  }

  _onLoading() async {
    await Future.delayed(Duration(milliseconds: 1500));
    for (int i = 0; i < 5; i++) {
      itemList.add("$i" + "新的");
    }
    setState(() {
      //刷新状态
    });
    _refreshController.loadComplete();
  }

  Widget _createListItem() {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, top: 16.0, right: 16.0),
      child: DecoratedBox(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(8.0))),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: new Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              //名字                 状态
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                textDirection: TextDirection.rtl,
                children: <Widget>[
                  OrderStatusCell(orderStatus: 1), //订单状态
                  Expanded(
                      child: Text(
                    '呱呱呱',
                    style: TextStyle(color: Colors.blue, fontSize: 16.0),
                  ))
                ],
              ),
              //订单编号             时间
              createPaddingWidget(
                  10.0,
                  Row(
                    textDirection: TextDirection.rtl,
                    children: <Widget>[
                      Text(
                        '08-22 19:22',
                        style: TextStyle(color: Colors.grey, fontSize: 12.0),
                      ),
                      Expanded(
                          child: Text(
                        '订单编号：100000000000014',
                        style: TextStyle(color: Colors.black, fontSize: 14.0),
                      ))
                    ],
                  )),

              //导购员
              createPaddingWidget(
                  4.0,
                  new Text('导购员：呱兄',
                      style: TextStyle(color: Colors.black, fontSize: 14.0))),
              //分割线
              createPaddingWidget(
                  10.0, Divider(color: Color(0xFF9B9B9B), height: 1.0)),
              //商品列表
              createPaddingWidget(
                  10.0,
                  Column(
                    children: <Widget>[
                      _createShopDetailsItem(),
                      _createShopDetailsItem()
                    ],
                  )),
              //分割线
              createPaddingWidget(
                  10.0, Divider(color: Color(0xFF9B9B9B), height: 1.0)),
              //订单总价
              createPaddingWidget(
                  10.0,
                  Row(
                    textDirection: TextDirection.rtl,
                    children: <Widget>[
                      Text(
                        '￥138',
                        style: TextStyle(color: Colors.blue, fontSize: 12.0),
                      ),
                      Text(
                        '订单总价：',
                        style: TextStyle(color: Colors.black, fontSize: 12.0),
                      ),
                    ],
                  )),
              //实付金额
              createPaddingWidget(
                  8.0,
                  Row(
                    textDirection: TextDirection.rtl,
                    children: <Widget>[
                      Text(
                        '￥138',
                        style: TextStyle(color: Colors.blue, fontSize: 12.0),
                      ),
                      Text(
                        '实付金额：',
                        style: TextStyle(color: Colors.black, fontSize: 12.0),
                      ),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }

  Widget _createShopDetailsItem() {
    return Flex(
      direction: Axis.horizontal,
      children: <Widget>[
        Image.network(
          'http://res.cloud.yoozworld.com/Fuc5cvVrsKlIs2CF4ximatppO7i2',
          width: 60.0,
          height: 60.0,
        ),
        Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    '烟弹4颗装',
                    style: TextStyle(color: Colors.black, fontSize: 12.0),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 3),
                    child: Text(
                      '清爽哈密瓜',
                      style:
                          TextStyle(color: Color(0xFF9B9B9B), fontSize: 12.0),
                    ),
                  ),
                  Text(
                    'SN 324234234234234',
                    style: TextStyle(color: Color(0xFF9B9B9B), fontSize: 12.0),
                  )
                ],
              ),
            )),
        Text(
          '￥168',
          style: TextStyle(color: Colors.black, fontSize: 12.0),
        )
      ],
    );
  }

  Padding createPaddingWidget(double topPadding, Widget child) {
    return Padding(
      padding: EdgeInsets.only(top: topPadding),
      child: child,
    );
  }
}
