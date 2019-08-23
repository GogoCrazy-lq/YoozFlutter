import 'package:flutter/material.dart';
import 'package:yoozflutter_mendian/main_home.dart';

//登录
class LoginPager extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: InPutWidget());
  }
}

class InPutWidget extends StatefulWidget {
  @override
  _InPutWidgetState createState() => _InPutWidgetState();
}

class _InPutWidgetState extends State<InPutWidget> {
  bool isShowPassWorld = false;
  var emailStr = "";
  var passWorld = "";

  final _emailController = TextEditingController();
  final _passController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _emailController.value = _emailController.value.copyWith(text: "test@yoozworld.com");
    _passController.value = _passController.value.copyWith(text: "123456");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            createRowInputTextField(
                textField: createInputTextField(false),
                rightImage: GestureDetector(
                  onTap: () {
                    setState(() {
                      _emailController.value = _emailController.value.copyWith(text: "");
                    });
                  },
                  child: Image.asset(
                    'assets/images/user_input_delete.png',
                    width: 16.0,
                    height: 16.0,
                  ),
                ),
                marginTop: 0),
            createRowInputTextField(
                textField: createInputTextField(true),
                rightImage: createPassImage(),
                marginTop: 16.0),
            Padding(
                //登录按钮
                padding: const EdgeInsets.only(top: 34.0),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: RaisedButton(
                        padding: const EdgeInsets.all(8.0),
                        color: Colors.blue,
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) {
                                    return MainPager();
                                  },
                                  maintainState: false));
                        },
                        child: Text('登录',
                            style:
                                TextStyle(fontSize: 18.0, color: Colors.white)),
                      ),
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }

  //创建输入框
  TextField createInputTextField(bool isPassWorld) {
    if (isPassWorld) {
      return TextField(
        controller: _passController,
        onChanged: (string) {
          emailStr = string;
        },
        obscureText: !isShowPassWorld,
        textAlignVertical: TextAlignVertical.center,
        keyboardType: TextInputType.number,
        style: TextStyle(fontSize: 16.0),
        decoration: InputDecoration(hintText: "输入密码", border: InputBorder.none),
        scrollPadding: const EdgeInsets.all(10.0),
      );
    } else {
      return TextField(
        controller: _emailController,
        onChanged: (string) {
          passWorld = string;
        },
        textAlignVertical: TextAlignVertical.center,
        keyboardType: TextInputType.emailAddress,
        style: TextStyle(fontSize: 16.0),
        decoration: InputDecoration(hintText: "输入账号", border: InputBorder.none),
        scrollPadding: const EdgeInsets.all(10.0),
      );
    }
  }

  //创建右侧图标
  Widget createPassImage() {
    if (isShowPassWorld) {
      //显示
      return GestureDetector(
        child: Image.asset(
          'assets/images/user_input_show.png',
          width: 16.0,
          height: 16.0,
        ),
        onTap: () {
          isShowPassWorld = !isShowPassWorld;
          setState(() {});
        },
      );
    } else {
      //隐藏
      return GestureDetector(
        child: Image.asset(
          'assets/images/user_input_hide.png',
          width: 16.0,
          height: 16.0,
        ),
        onTap: () {
          isShowPassWorld = !isShowPassWorld;
          setState(() {});
        },
      );
    }
  }

  //创建行
  Container createRowInputTextField(
      {Widget textField, Widget rightImage, double marginTop}) {
    return Container(
        margin: EdgeInsets.only(top: marginTop),
        child: DecoratedBox(
            decoration: BoxDecoration(
                border: BoxBorder.lerp(
                    Border.all(
                        color: Colors.blue, width: 1, style: BorderStyle.solid),
                    Border.all(
                        color: Colors.blue, width: 1, style: BorderStyle.solid),
                    1),
                borderRadius: BorderRadius.all(Radius.circular(6.0))),
            child: Padding(
              padding: const EdgeInsets.only(left: 12.0, right: 12.0),
              child: Row(
                textDirection: TextDirection.rtl,
                children: <Widget>[
                  rightImage,
                  Expanded(
                    child: textField,
                  )
                ],
              ),
            )));
  }

  @override
  void dispose() {
    _passController.dispose();
    _emailController.dispose();
    super.dispose();
  }
}
