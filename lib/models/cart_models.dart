import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:devpizzaria/datas/car_data.dart';
import 'package:devpizzaria/models/user_models.dart';
import 'package:flutter/cupertino.dart';
import 'package:scoped_model/scoped_model.dart';

class CartModel extends Model{

  UserModel user;

  List<CartProduct> product = [];

  String cupomCode;
  int discountPercentage = 0;

  static CartModel of(BuildContext context) =>
  ScopedModel.of<CartModel>(context);

  CartModel(this.user){
   if(user.isLoggedIn()){ _loadCartItems();}
  }

  bool isLoading = false;

  void addCartItem(CartProduct cartProduct){
    product.add(cartProduct);

    Firestore.instance.collection("users").document(user.firebaseUser.uid)
        .collection("cart").add(cartProduct.toMap()).then((doc){
          cartProduct.cid = doc.documentID;
    });

    notifyListeners();
  }

  void removeCartItem(CartProduct cartProduct){
    Firestore.instance.collection("users").document(user.firebaseUser.uid)
        .collection("cart").document(cartProduct.cid).delete();

    product.remove(cartProduct);

    notifyListeners();

  }

  void decProduct(CartProduct cartProduct){
    cartProduct.quantity --;
    
    Firestore.instance.collection("users").document(user.firebaseUser.uid)
        .collection("cart").document(cartProduct.cid)
        .updateData(cartProduct.toMap());

    notifyListeners();
  }
  
  void incProduct(CartProduct cartProduct){
    cartProduct.quantity ++;

    Firestore.instance.collection("users").document(user.firebaseUser.uid)
        .collection("cart").document(cartProduct.cid)
        .updateData(cartProduct.toMap());

    notifyListeners();
  }

  void _loadCartItems() async {
    QuerySnapshot query = await Firestore.instance.collection("users").document(user.firebaseUser.uid)
    .collection("cart").getDocuments();

    product = query.documents.map((doc)=> CartProduct.fromDocument(doc));

    notifyListeners();
  }

  void setCupom(String cupomCode, int discountPercentage ){
    this.cupomCode = cupomCode;
    this.discountPercentage = discountPercentage;
  }

  void updatePrices(){
    notifyListeners();
  }

  double getProductsPrice(){
    double price = 0.0;
    for(CartProduct c in product){
      if(c.productData != null)
        price += c.quantity + c.productData.preco;
    }
    return price;
  }

  double getDiscount(){
    return getProductsPrice() * discountPercentage / 100;
  }

  double getShipPrice(){
    return 9.99;
  }

  Future<String> finishOrder() async {
    if(product.length == 0) return null;

    isLoading = true;
    notifyListeners();

    double productsPrice = getProductsPrice();
    double discountPrice = getDiscount();
    double shipPrice = getShipPrice();
    
   DocumentReference refOrder = await Firestore.instance.collection("oders").add({
      "clientid":user.firebaseUser.uid,
      "product": product.map((cartProduct)=>cartProduct.toMap()).toList(),
      "shipPrice":shipPrice,
      "productPrice":productsPrice,
      "discountPrice":discountPrice,
      "totalPrice":shipPrice + productsPrice - discountPrice,
      "status":1,

    });
   await Firestore.instance.collection("users").document(user.firebaseUser.uid)
    .collection("orders").document(refOrder.documentID).setData({
      "orderID":refOrder.documentID,
    }
   );

    QuerySnapshot query = await Firestore.instance.collection("users").document(user.firebaseUser.uid)
       .collection("cart").getDocuments();

    for(DocumentSnapshot doc in query.documents){
      doc.reference.delete();
    }

    product.clear();

    cupomCode = null;
    discountPercentage = 0;

    isLoading = false;
    notifyListeners();

    return refOrder.documentID;

  }

}