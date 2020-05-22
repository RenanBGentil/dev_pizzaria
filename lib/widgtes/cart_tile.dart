import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:devpizzaria/datas/car_data.dart';
import 'package:devpizzaria/datas/product_datas.dart';
import 'package:devpizzaria/models/cart_models.dart';
import 'package:flutter/material.dart';

class CartTile extends StatelessWidget {

  final CartProduct cartProduct;

  const CartTile({Key key, this.cartProduct}) : super(key: key);

  Widget _buildContent(BuildContext context){
    CartModel.of(context).updatePrices();
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(8.0),
          width: 120.0,
          child: Image.network(
            cartProduct.productData.images[0],
            fit: BoxFit.cover,
          ),
        ),
        Expanded(
          child: Container(
            padding: EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(cartProduct.productData.title,
                style: TextStyle(
                  fontWeight: FontWeight.w300,
                  fontSize: 17.0,
                  ),
                ),
                Text(cartProduct.productData.preco.toStringAsFixed(2),
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.remove),
                      onPressed: cartProduct.quantity > 1 ? (){
                        CartModel.of(context).decProduct(cartProduct);
                      }: null,
                    ),
                      Text(cartProduct.quantity.toString()),
                    IconButton(
                      icon: Icon(Icons.add),
                      onPressed: (){
                        CartModel.of(context).incProduct(cartProduct);
                      },
                    ),
                    FlatButton(
                      child: Text("Remover"),
                      textColor: Colors.grey,
                      onPressed: (){
                        CartModel.of(context).removeCartItem(cartProduct);
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      child: cartProduct.productData == null ?
      FutureBuilder<DocumentSnapshot>(
        future: Firestore.instance.collection("products")
            .document(cartProduct.category).collection("items")
            .document(cartProduct.pid).get(),
        builder: (context, snapshot){
          if (snapshot.hasData){
            cartProduct.productData = ProductData.fromDocument(snapshot.data);
            return _buildContent(context);
          }
          return Container(
            child: CircularProgressIndicator(),
            alignment: Alignment.center,
          );
        },
      ) : _buildContent(context),
    );
  }
}
