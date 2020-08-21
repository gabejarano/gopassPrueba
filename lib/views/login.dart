import 'package:app_gopass/views/signup.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/widgets.dart';

import 'formLogin.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {

    ScreenUtil.instance = ScreenUtil(width: 1080, height: 1920)..init(context);
    return Scaffold(
      backgroundColor: Colors.black54,
      body: DecoratedBox(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/background.jpg')
          ),
        ),
        child: Container (
          margin: EdgeInsets.symmetric(
            horizontal: ScreenUtil.getInstance().setHeight(30),
            vertical: ScreenUtil.getInstance().setHeight(30)
          ),
          child: Align(
            alignment: FractionalOffset.bottomRight,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: ScreenUtil.getInstance().setHeight(900)),
                Material(
                  elevation: 5.0,
                  borderRadius: BorderRadius.circular(30.0),
                  color: Colors.white,
                  child: MaterialButton(
                      minWidth: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.symmetric(
                          horizontal: ScreenUtil.getInstance().setWidth(40),
                          vertical: ScreenUtil.getInstance().setHeight(40)),
                      onPressed: () {
                        createSignInForm();
                      },
                    child: Text(
                      "Iniciar Sesión",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold)
                      ),
                    ),
                  ),
                const SizedBox(height: 15),

              ],
            ),
          ),
        ),
      ),
    );
  }



  //Muestra el formulario para loguearse en la aplicación
  createSignInForm(){
    Navigator.push(context, MaterialPageRoute(
      builder: (context) => FormLogin(), fullscreenDialog: true ));
  }
}
