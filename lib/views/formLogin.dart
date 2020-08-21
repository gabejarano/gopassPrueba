import 'package:app_gopass/views/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FormLogin extends StatefulWidget {
  @override
  _FormLoginState createState() => _FormLoginState();
}

class _FormLoginState extends State<FormLogin> {
  String _email, _password;
  final GlobalKey<ScaffoldState> _scaffoldkey = new GlobalKey<ScaffoldState>();
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 15.0);
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldkey,
        appBar: new AppBar(backgroundColor: Colors.black),
        body: Form(
            key: _formkey,
            child: SingleChildScrollView(
                padding:
                    EdgeInsets.symmetric(horizontal: 20.0, vertical: 160.0),
                child: Container(
                  margin:
                      EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(height: 10.0),
                      TextFormField(
                        inputFormatters: [LengthLimitingTextInputFormatter(50)],
                        validator: (input) {
                          if (input.isEmpty) {
                            return 'provide an email';
                          }
                        },
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                horizontal:
                                    ScreenUtil.getInstance().setWidth(30),
                                vertical:
                                    ScreenUtil.getInstance().setHeight(30)),
                            hintText: 'Email',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(32.0))),
                        obscureText: false,
                        style: style,
                        onSaved: (input) => _email = input,
                      ),
                      SizedBox(height: 10.0),
                      TextFormField(
                        inputFormatters: [LengthLimitingTextInputFormatter(50)],
                        validator: (input) {
                          if (input.length < 6) {
                            return 'Longer password please';
                          }
                        },
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                horizontal:
                                    ScreenUtil.getInstance().setWidth(30),
                                vertical:
                                    ScreenUtil.getInstance().setHeight(30)),
                            hintText: 'password',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(32.0))),
                        onSaved: (input) => _password = input,
                        obscureText: true,
                        style: style,
                      ),
                      SizedBox(height: ScreenUtil.getInstance().setHeight(90)),
                      Material(
                        elevation: 5.0,
                        borderRadius: BorderRadius.circular(30.0),
                        color: Colors.black,
                        child: MaterialButton(
                            minWidth: MediaQuery.of(context).size.width,
                            padding: EdgeInsets.symmetric(
                                horizontal:
                                    ScreenUtil.getInstance().setWidth(30),
                                vertical:
                                    ScreenUtil.getInstance().setHeight(30)),
                            onPressed: () {
                              login();
                            },
                            child: Text(
                              'Login',
                              textAlign: TextAlign.center,
                              style: style.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            )),
                      ),
                      SizedBox(height: ScreenUtil.getInstance().setHeight(30)),
                    ],
                  ),
                ))));
  }

  login(){
    Navigator.push(context, MaterialPageRoute(
        builder: (context) => Home(), fullscreenDialog: true ));
  }
}
