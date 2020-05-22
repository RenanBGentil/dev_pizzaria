import 'package:devpizzaria/datas/car_data.dart';
import 'package:devpizzaria/models/cart_models.dart';
import 'package:devpizzaria/models/user_models.dart';
import 'package:devpizzaria/widgtes/cart_price.dart';
import 'package:devpizzaria/widgtes/cart_tile.dart';
import 'package:devpizzaria/widgtes/discount_card.dart';
import 'package:devpizzaria/widgtes/ship_card.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

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
              child: ScopedModelDescendant<CartModel>(
                builder: (context, child, model){
                  int p = model.product.length;
                  return Text("${p ?? 0} ${p == 1 ? "ITEM" : "ITENS"}",
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
      body: ScopedModelDescendant<CartModel>(
        builder: (context, child, model){
          if(model.isLoading && UserModel.of(context).isLoading){
            return Center(child: CircularProgressIndicator(),);
          }
          else if(!UserModel.of(context).isLoggedIn()){
            return Padding(
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
            );
          }
          else if(model.product == null || model.product == 0){
            return Center(
              child: Text("Nenhum produto no carrinho",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                ),
              ),
            );
          }
          else {
            return ListView(
              children: <Widget>[
                Column(
                children: model.product.map((product){
                  return CartTile(cartProduct: product,);
                }).toList()
                ),
                DiscountCard(),
                ShipCard(),
                CartPrice(
                  buy: () async {
                    String orderID = await model.finishOrder();
                    if(orderID != null){
                      print(orderID);
                    }
                  },
                ),
              ],
            );
          }
        },
      ),
    );
  }
}