import 'package:devpizzaria/screens/pizza_screen.dart';
import 'package:flutter/cupertino.dart';
import'package:flutter/material.dart';
import 'category_screen.dart';
import 'launch_screen.dart';

    class ProdutoScreen extends StatefulWidget {
      @override
      _ProdutoScreenState createState() => _ProdutoScreenState();
    }

    class _ProdutoScreenState extends State<ProdutoScreen> {

      @override
      Widget build(BuildContext context) {
        return Stack(
          children: <Widget>[
            Column(
            children: <Widget>[
              ListTile(
                leading: CircleAvatar(
                  radius: 25.0,
                  backgroundColor: Colors.transparent,
                  backgroundImage: AssetImage('images/soda.png',),
                ),
                title: Text("Bebidas"),
                trailing:  Icon(Icons.arrow_right),
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>CategoryScreen()),);
                },
              ),

              Divider(
                color: Colors.red,
              ),

              ListTile(
                leading: CircleAvatar(
                  radius: 25.0,
                  backgroundColor: Colors.transparent,
                  backgroundImage: AssetImage('images/lanche.jpg',),
                ),
                title: Text("Lanches"),
                trailing:  Icon(Icons.arrow_right),
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=> LaunchScreen()));
                },
              ),

              Divider(
                color: Colors.red,
              ),

              ListTile(
                leading: CircleAvatar(
                  radius: 25.0,
                  backgroundColor: Colors.transparent,
                  backgroundImage: AssetImage('images/pizza.png',),
                ),
                title: Text("Pizzas"),
                trailing:  Icon(Icons.arrow_right),
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=> PizzaScreen()));
                },
              ),

              Divider(
                color: Colors.red,
              ),

              Padding(
                padding: EdgeInsets.fromLTRB(230.0, 180.0, 0.0, 0.0),
                child:FloatingActionButton(
                  backgroundColor: Colors.red,
                  child: Icon(
                      Icons.add_shopping_cart
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, 'car');
                  },
                ),
              ),
            ],
          ),
          ],
        );
      }
    }