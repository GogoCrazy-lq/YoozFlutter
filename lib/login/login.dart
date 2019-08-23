import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yoozflutter_mendian/main_home.dart';
import 'package:yoozflutter_mendian/utils/ToastUtils.dart';

//登录
class LoginPager extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            body: InPutWidget(), resizeToAvoidBottomPadding: false) //防止软键盘叮咚布局
        );
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
    _emailController.value =
        _emailController.value.copyWith(text: "test@yoozworld.com");
    _passController.value = _passController.value.copyWith(text: "123456");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Stack(
        alignment: AlignmentDirectional.topCenter,
        children: <Widget>[
          Positioned(
            top: 120.0,
            left: 0,
            right: 0,
            bottom: 0,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(bottom: 50.0),
                  child: Image.asset(
                    'assets/images/user_login_logo.png',
                    width: 180.0,
                    height: 46.0,
                  ),
                ),
                createRowInputTextField(
                    textField: createInputTextField(false),
                    rightImage: GestureDetector(
                      onTap: () {
                        setState(() {
                          _emailController.value =
                              _emailController.value.copyWith(text: "");
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
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Row(
                    textDirection: TextDirection.rtl,
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          showToast('修改密码');
                        },
                        child: Text(
                          '忘记密码',
                          style: TextStyle(color: Colors.blue, fontSize: 14.0),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                    //登录按钮
                    padding: const EdgeInsets.only(
                        top: 30.0, left: 10.0, right: 10.0),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: RaisedButton(
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8.0))),
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
                                style: TextStyle(
                                    fontSize: 18.0, color: Colors.white)),
                          ),
                        ),
                      ],
                    )),
              ],
            ),
          ),
          Positioned(
            bottom: 0.0,
            child: Row(
              children: <Widget>[
                Wrap(
                  children: <Widget>[
                    Text(
                      '点击登录，即表示已阅读并同意',
                      style:
                          TextStyle(color: Color(0xFF9B9B9B), fontSize: 12.0),
                    ),
                    GestureDetector(
                      onTap: () {
                        showToast('YOOZ用户协议');
                      },
                      child: Text(
                        'YOOZ用户协议',
                        style: TextStyle(
                            color: Colors.blue,
                            fontSize: 12.0,
                            decoration: TextDecoration.underline,
                            decorationColor: Colors.blue,
                            decorationStyle: TextDecorationStyle.solid),
                      ),
                    )
                  ],
                )
              ],
            ),
          )
        ],
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
        decoration: InputDecoration(
            hintText: "输入密码",
            hintStyle: TextStyle(color: Color(0xFF9B9B9B)),
            border: InputBorder.none),
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
        decoration: InputDecoration(
            hintText: "输入账号",
            hintStyle: TextStyle(color: Color(0xFF9B9B9B)),
            border: InputBorder.none),
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
                        color: Color(0xFFECECEC),
                        width: 1,
                        style: BorderStyle.solid),
                    Border.all(
                        color: Color(0xFFECECEC),
                        width: 1,
                        style: BorderStyle.solid),
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
