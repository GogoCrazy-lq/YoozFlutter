import 'package:flutter/material.dart';
import 'package:yoozflutter_mendian/manage/dialog/BottomDialog.dart';

class YooZManagePager extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            '会员管理',
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
        ),
        body: createListView(context),
      ),
    );
  }

  ListView createListView(BuildContext context) {
    return new ListView.separated(
      separatorBuilder: (context, index) {
        return Divider(
          color: Color(0xFFECECEC),
          height: 1.0,
        );
      },
      itemCount: 20,
      itemBuilder: (context, index) {
        return createListItem(context);
      },
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
    );
  }

  Widget createListItem(BuildContext context) {
    return Material(
      color: Colors.white,
      //涟漪效果
      child: InkWell(
        onTap: () {
          showDialog(
              context: context,
              barrierDismissible: true,
              builder: (context) {
                return new BottomDialog(name: '瓜兄', phone: '');
              });
        },
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: new Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                textDirection: TextDirection.rtl,
                children: <Widget>[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text('累计消费',
                          style: TextStyle(fontSize: 14.0, color: Colors.grey)),
                      Text('￥233',
                          style: TextStyle(fontSize: 14.0, color: Colors.black))
                    ],
                  ),
                  Expanded(
                    child: Text('呱呱',
                        style: TextStyle(fontSize: 16.0, color: Colors.black)),
                  )
                ],
              ),
              Container(
                margin: const EdgeInsets.only(top: 3.0),
                child: Text('累计消费1套烟弹4颗装',
                    style: TextStyle(fontSize: 14.0, color: Colors.grey)),
              ),
              Container(
                margin: const EdgeInsets.only(top: 6.0),
                child: Text('消费1次，最近消费事件07-27 11:23',
                    style: TextStyle(fontSize: 14.0, color: Colors.black)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
