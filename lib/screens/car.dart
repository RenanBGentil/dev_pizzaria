import 'package:flutter/material.dart';

class CarScreen extends StatefulWidget {
  @override
  _CarScreenState createState() => _CarScreenState();
}

class _CarScreenState extends State<CarScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Compras"),
        centerTitle: true,
        actions: <Widget>[
          Center(
            child:
            Container(
              padding: EdgeInsets.fromLTRB(0.0, 10.0, 10.0, 0.0),
              child: Text("0 ITENS",
                style: TextStyle(
                  fontSize: 20.0,
                ),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(50.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.add_shopping_cart,
              size: 150.0,
            ),
            const SizedBox(
              height: 20.0,
            ),
            Text("Entre para adicionar proditos",
            style: TextStyle(
              color: Colors.red,
              fontSize: 20.0,
              ),
            ),
            const SizedBox(
               height: 20.0,
            ),
            FlatButton(
              child: Text("ENTRAR",
                style:TextStyle(
                  color: Colors.white,
                  fontSize: 20.0
                ),
                  ),
              color: Colors.red,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              padding: EdgeInsets.symmetric(vertical: 14.0, horizontal: 60.0,),
              onPressed: (){
                Navigator.popAndPushNamed(context, 'login');
              },
            ),
          ],
        ),
      ),
    );
  }
}