import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:devpizzaria/datas/product_datas.dart';

class CartProduct{

  String cid;
  String category;
  String pid;
  String title;

  int quantity;

  ProductData productData;

  CartProduct();

  CartProduct.fromDocument(DocumentSnapshot document){
    cid = document.documentID;
    category = document.data["category"];
    pid = document.data["pid"];
    quantity = document.data["quantity"];
    title = document.data["title"];
  }

  Map<String, dynamic>toMap(){
    return {
      "category":category,
      "pid":pid,
      "quantity":quantity,
      "title":title,
      "productData":productData.toResumedMap(),
    };
  }

}