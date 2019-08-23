import 'package:flutter/material.dart';

///当前订单的一个状态是什么
///已支付
///待支付
///已取消
class OrderStatusCell extends StatelessWidget {
  var orderStatus;

  OrderStatusCell({Key key, this.orderStatus}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: const Color(0xFFECECEC),
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        child: Padding(
          padding: const EdgeInsets.only(
              left: 8.0, top: 4.0, right: 8.0, bottom: 4.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center, //垂直居中
            children: <Widget>[
              createImage(),
              Padding(
                padding: const EdgeInsets.only(left: 3.0),
                child: createText(),
              )
            ],
          ),
        ),
      ),
    );
  }

  //状态图
  Widget createImage() {
    if (orderStatus == 0) {
      return Image.asset('assets/images/order_complete_icon.png',
          width: 14.0, height: 12.0);
    } else if (orderStatus == 1) {
      return Image.asset('assets/images/order_warning_icon.png',
          width: 14.0, height: 12.0);
    } else {
      return Image.asset('assets/images/order_cancel_icon.png',
          width: 14.0, height: 12.0);
    }
  }

  Widget createText() {
    if (orderStatus == 0) {
      return Text(
        '已完成',
        style: TextStyle(color: Colors.blue, fontSize: 14.0),
      );
    } else if (orderStatus == 1) {
      return Text(
        '待支付',
        style: TextStyle(color: Colors.blue, fontSize: 14.0),
      );
    } else {
      return Text(
        '已取消',
        style: TextStyle(color: Colors.blue, fontSize: 14.0),
      );
    }
  }
}
