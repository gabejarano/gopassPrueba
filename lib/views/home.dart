import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'drawer.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  double xOffset = 0;
  double yOffset = 0;
  double scaleFactor = 1;
  bool isDrawerOpen = false;
  List establecimientos;
  Map data;

  void getEstablecimietos() async{
    http.Response response= await http.get("https://apiprueba.gopass.com.co/establishment/getAllEstablishment");
    data = json.decode(response.body);
    setState(() {
      establecimientos = data['data'];
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getEstablecimietos();
  }
  @override
  Widget build(BuildContext context) {
  return  Scaffold(

    body: Stack(
      children: [
        DrawerScreen(),
        AnimatedContainer(
          transform: Matrix4.translationValues(xOffset, yOffset, 0)
            ..scale(scaleFactor),
          duration: Duration(milliseconds: 250),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(isDrawerOpen?15:0),
            color: Colors.grey[200],
          ),
          child: Column(
            children: [
              SizedBox(height: 50,),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    isDrawerOpen?IconButton(
                      icon: Icon(Icons.arrow_back_ios),
                      onPressed: (){
                        setState(() {
                          xOffset=0;
                          yOffset=0;
                          scaleFactor =1;
                          isDrawerOpen=false;
                        });
                      },
                    ): IconButton(icon: Icon(Icons.menu), onPressed: (){
                      setState(() {
                        xOffset=238;
                        yOffset=150;
                        scaleFactor=0.6;
                        isDrawerOpen=true;
                      });
                    },),
                    Column(
                      children: [
                        Text('Location'),
                        Row(
                          children: [
                            Icon(Icons.location_on, color: Colors.black45,),
                            Text('Colombia'),
                          ],
                        )
                      ],
                    ),
                    Text(
                        "GoPass"
                    )
                  ],
                ),
              ),
              Container(
                child: Expanded(
                  child: ListView.builder(itemCount: establecimientos==null?0: establecimientos.length ,
                    physics: const AlwaysScrollableScrollPhysics(),
                    itemBuilder: (BuildContext context, int index){
                      return Card(
                          margin: EdgeInsets.symmetric(horizontal: 20),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Text(
                                  "${establecimientos[index]["nombre"]}"
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              )
            ],
          ),

        )
      ],

    )
  );
}}

