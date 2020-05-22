import 'package:devpizzaria/models/cart_models.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class CartPrice extends StatelessWidget {

  final VoidCallback buy;

  const CartPrice({Key key, this.buy}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      child: Container(
        padding: EdgeInsets.all(16.0),
        child: ScopedModelDescendant<CartModel>(
          builder: (context, child, model){

            double price = model.getProductsPrice();
            double discount = model.getDiscount();
            double ship = model.getShipPrice();

            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text("Resumo do pedido", textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                ),
                ),
                SizedBox(height: 12.0,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("Subtotal"),
                    Text("R\$ ${price.toStringAsFixed(2)}"),
                  ],
                ),
                Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("Entrega"),
                    Text("R\$ ${discount.toStringAsFixed(2)}"),
                  ],
                ),
                SizedBox(height: 12.0,),
                Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("Total",style: TextStyle(
                      fontWeight: FontWeight.w500,
                    ),),
                    Text("R\$ ${(price + ship - discount).toStringAsFixed(2)}",style: TextStyle(
                      fontSize: 16.0,
                    ),),
                    SizedBox(height: 12.0,),
                    RaisedButton(
                      child: Text("Finalizar pedido"),
                      textColor: Colors.white,
                      color: Colors.red,
                      onPressed: buy,
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}