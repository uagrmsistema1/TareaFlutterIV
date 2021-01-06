import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/menu.dart';
import 'menu.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,

        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: PaginaInicio(),
      initialRoute: "/",
      routes: {
        '/menu': (context)=>PaginaMenu(),
      },
    );
  }
}

class PaginaInicio extends StatefulWidget{
  @override
  _PaginaInicio createState () => new _PaginaInicio();

}

class _PaginaInicio extends State<PaginaInicio>{
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset("assets/img/ic_launcher.png"),
            Text("App Flutter IV"),
            RaisedButton(
              child: Text("Acceder"),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                    bottomLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15)

                  )
                ),
                onPressed: (){
                  Navigator.pushNamed(context, "/menu");
                }
            )
          ],
        ),
      ),
    );
  }
}

