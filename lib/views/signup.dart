

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Signup extends StatefulWidget {
  const Signup();

  @override
  State<StatefulWidget> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final GlobalKey<ScaffoldState> _scaffoldkey = new GlobalKey<ScaffoldState>();
  String _email, _password, _nombres, _telefono, _apellidos, _tipoDocumento, _numeroDocumento;
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 15.0);
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();


  Future<void> signUp() async {
    final formState = _formkey.currentState;
    if (formState.validate()) {
      formState.save();
      Map body = new Map();
      body["tipoDocumento"]=_tipoDocumento;
      body["numeroIdentificacion"]=_numeroDocumento;
      body["nombres"]=_nombres;
      body["apellidos"]=_apellidos;
      body["telefonoMovil"]=_telefono;
      body["correo"]=_email;
      body["password"]=_password;
      http.Response response =  await http.post("https://apiprueba.gopass.com.co/client/registre",body: body);
      var data = json.decode(response.body);
      if(data["return"]){
        _scaffoldkey.currentState.showSnackBar(SnackBar(
          content: Text("El usuario se registro correctamente"),
          duration: Duration(milliseconds: 10000),
        ));
      }else{
        _scaffoldkey.currentState.showSnackBar(SnackBar(
          content: Text("Lo sentimos, no se pudo registrar el usuario por la siguiente razon: " +data["message"]),
          duration: Duration(milliseconds: 10000),
        ));
      }
      print("++++++++++++++++");
      print(response.body);
    }
  }

  Widget build(BuildContext context) {
    final botonEnviar = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Colors.black,
      child: MaterialButton(
          minWidth: MediaQuery.of(context).size.width,
          padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          onPressed: () {
            signUp();
          },
          child: Text(
            'Registrar',
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold),
          )),
    );
    final nombresField = TextFormField(
      validator: (input) {
        if (input.isEmpty) {
          return 'Por favor ingresa tu nombre';
        }
      },
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: 'Nombres',
          border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
      obscureText: false,
      style: style,
      onSaved: (input) => _nombres = input,
    );
    final apellidosField = TextFormField(
      validator: (input) {
        if (input.isEmpty) {
          return 'Por favor ingresa tus apellidos';
        }
      },
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: 'Apellidos',
          border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
      obscureText: false,
      style: style,
      onSaved: (input) => _apellidos = input,
    );
    final numeroIdentificacionField = TextFormField(
      validator: (input) {
        if (input.isEmpty) {
          return 'Por favor ingresa tu numero de identificación';
        }
      },
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: 'Numero Identificación',
          border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
      obscureText: false,
      style: style,
      onSaved: (input) => _numeroDocumento = input,
    );
    final telefonoField = TextFormField(
      validator: (input) {
        if (input.isEmpty) {
          return 'Por favor ingresa tu telefono';
        }
      },
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: 'Telefono',
          border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
      obscureText: false,
      style: style,
      onSaved: (input) => _telefono = input,
    );
    final emailField = TextFormField(
      validator: (input) {
        if (input.isEmpty) {
          return 'Por favor ingresa un email';
        }
      },
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: 'Email',
          border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
      obscureText: false,
      style: style,
      onSaved: (input) => _email = input,
    );
    final passwordField = TextFormField(
      validator: (input) {
        if (input.length < 6) {
          return 'por favor ingresa una contraseña con más de 6 caracteres';
        }
      },
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: 'Password',
          border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
      obscureText: true,
      style: style,
      onSaved: (input) => _password = input,
    );

    final tipoIdentificacionField = DropdownButton<String>(
      hint: Text("Tipo de identificación"),
      items: [
        "1",
        "TI",
        "CE",
        "Pasaporte"
      ].map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text("$value"),
        );
      }).toList(),
      onChanged: (String changedValue) {
        setState(() {
          _tipoDocumento = changedValue;
        });
      },
      value: _tipoDocumento,
    );

    return Scaffold(
        key: _scaffoldkey,
        appBar: new AppBar(backgroundColor: Colors.black),
        body: Form(
          key: _formkey,
          child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 80.0),
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    nombresField,
                    SizedBox(height: 10.0),
                    apellidosField,
                    SizedBox(height: 10.0),
                    telefonoField,
                    SizedBox(height: 10.0),
                    tipoIdentificacionField,
                    SizedBox(height: 10.0),
                    numeroIdentificacionField,
                    SizedBox(height: 10.0),
                    emailField,
                    SizedBox(height: 10.0),
                    passwordField,
                    SizedBox(height: 10.0),
                    botonEnviar
                  ],
                ),
              )),
        ));
  }


}
