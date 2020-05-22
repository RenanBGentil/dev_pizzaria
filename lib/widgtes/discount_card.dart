import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:devpizzaria/models/cart_models.dart';
import 'package:flutter/material.dart';

class DiscountCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      child: ExpansionTile(
        title: Text("Cupom De Desconto",textAlign: TextAlign.start,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.red,
        ),
        ),
        leading: Icon(Icons.card_giftcard),
        trailing: Icon(Icons.add),
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(8.0),
            child: TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Insira o seu cupom",
              ),
              initialValue: CartModel.of(context).cupomCode ?? "",
              onFieldSubmitted: (text){
                Firestore.instance.collection("cupons").document(text).get()
                    .then((docSnap){
                      if(docSnap.data != null){
                        CartModel.of(context).setCupom(text, docSnap.data["percent"]);
                        Scaffold.of(context).showSnackBar(SnackBar(
                          content: Text("desconto de ${docSnap.data["percent"]}"),
                        ));
                      }
                      else{
                        CartModel.of(context).setCupom(null, 0);
                        Scaffold.of(context).showSnackBar(SnackBar(
                          content: Text("Cupom não existente"),
                        ));
                      }
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
