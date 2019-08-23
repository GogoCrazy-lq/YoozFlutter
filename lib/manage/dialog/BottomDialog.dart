import 'package:flutter/material.dart';
import 'package:yoozflutter_mendian/utils/ToastUtils.dart';

class BottomDialog extends Dialog {
  String name;
  String phone;

  BottomDialog({Key key, @required this.name, @required this.phone})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Material(
      //创建透明层
      type: MaterialType.transparency,
      //空间位于底部
      child: new Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                DecoratedBox(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(8.0))),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      createItemTitle(),
                      createDivider(),
                      createItem(context, '发短信'),
                      createDivider(),
                      createItem(context, '打电话')
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 16.0),
                  child: DecoratedBox(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(8.0))),
                      child: GestureDetector(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Text(
                                  '取消',
                                  style: TextStyle(
                                      fontSize: 18.0, color: Colors.lightBlue),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            )
                          ],
                        ),
                        onTap: () {
                          Navigator.pop(context);
                        },
                      )),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget createDivider() {
    return Divider(
      height: 1.0,
      color: Color(0xFFECECEC),
    );
  }

  Widget createItemTitle() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
            name,
            style: TextStyle(fontSize: 18.0, color: Colors.black),
          ),
        )
      ],
    );
  }

  Widget createItem(BuildContext context, String title) {
    return GestureDetector(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              title,
              style: TextStyle(fontSize: 18.0, color: Colors.lightBlue),
              textAlign: TextAlign.center,
            ),
          ))
        ],
      ),
      onTap: () {
        showToast('正在呼叫$name');
        Navigator.pop(context);
      },
    );
  }
}


