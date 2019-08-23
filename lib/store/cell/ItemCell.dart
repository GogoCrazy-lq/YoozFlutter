import 'package:flutter/material.dart';

class ItemCell extends StatelessWidget {
  String leftContent;

  ItemCell({Key key, @required this.leftContent}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      ConstrainedBox(
        constraints:
            BoxConstraints.expand(width: double.infinity, height: 48.0),
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Positioned(
              left: 16.0,
              child: Text(
                leftContent,
                style: TextStyle(color: Colors.black),
              ),
            ),
            Positioned(
              right: 16.0,
              child: Image.asset('assets/images/store_list_arrow_right.png',
                  width: 16.0, height: 16.0),
            )
          ],
        ),
    );
  }
}
