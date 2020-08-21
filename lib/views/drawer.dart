import 'package:app_gopass/views/login.dart';
import 'package:app_gopass/views/signup.dart';
import 'package:flutter/material.dart';

import 'home.dart';

class DrawerScreen extends StatefulWidget {
  @override
  _DrawerState createState() => _DrawerState();
}

class _DrawerState extends State<DrawerScreen> {


  //Muestra el formulario para registrarse en la aplicación
  createSingUpForm() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => Signup(), fullscreenDialog: true));
  }

  //Muestra la pantalla Home
  createHome() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => Home(), fullscreenDialog: true));
  }

  //Muestra la pantalla Login
  createLogin() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => Login(), fullscreenDialog: true));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 70, bottom: 70, left: 30),
      color: Colors.black,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Text(
                "GoPass",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              )
            ],
          ),
          Column(
            children: [
              MaterialButton(
                onPressed: () {
                  createSingUpForm();
                },
                child: Row(
                  children: [
                    Icon(Icons.supervised_user_circle, color: Colors.white),
                    SizedBox(
                      width: 18,
                    ),
                    Text(
                      "Registrar usuario",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
              ),
              MaterialButton(
                onPressed: () {
                  createHome();
                },
                child: Row(
                  children: [
                    Icon(Icons.store, color: Colors.white),
                    SizedBox(
                      width: 18,
                    ),
                    Text(
                      "Establecimientos",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
              )
            ],
          ),
          MaterialButton(
            onPressed: (){
              createLogin();
            },
            child: Row(
              children: [
                Icon(Icons.exit_to_app, color: Colors.white),
                SizedBox(
                  width: 18,
                ),
                Text(
                  "Cerrar sesión",
                  style:
                      TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

}
