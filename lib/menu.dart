import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class PaginaMenu extends StatefulWidget{
  @override
  _PaginaMenu createState () => new _PaginaMenu();

}

class _PaginaMenu extends State<PaginaMenu>{
  String url = "http://192.168.0.12/applogin/public/jsonusuarios";
  List data;
  Future<String> Recibir() async{
    var response = await http.get(Uri.encodeFull(url), headers: {"Accept":"application/json"});
    setState(() {
      var extraerData = json.decode(response.body);
      data = extraerData["listusuarios"];
      print(data.toString());
    });
  }
  void initState(){
      this.Recibir();
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(title: Text("Informacion de Usuarios"),),
      body: Center(
        child: new ListView.builder(
            itemCount: data==null ? 0 : data.length,
            itemBuilder: (BuildContext context, i){
               return new Card(
                 child: Column(
                   children: <Widget>[
                     /*Stack(
                       children: <Widget>[
                         Center(child: CircularProgressIndicator(),),
                         Center(
                            child: Image.network(
                              "http://192.168.0.12/applogin/public/img/usuarios"+data[i]['urlfoto']
                            ),
                         )
                       ],
                     ),*/
                     Text(data[i]['nombre'], style: TextStyle(fontSize: 20,), textAlign: TextAlign.center,),
                     Text(data[i]['apellido'], style: TextStyle(fontSize: 20,), textAlign: TextAlign.center,),
                     Text(data[i]['direccion'], style: TextStyle(fontSize: 20,), textAlign: TextAlign.center,),
                     Align(
                       alignment: Alignment.centerRight,
                       child: Text(data[i]['updated_at']),
                     )
                   ],
                 ),
               );
            }
        )
      )
    );
  }
}