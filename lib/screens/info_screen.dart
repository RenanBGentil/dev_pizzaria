import 'package:carousel_pro/carousel_pro.dart';
import 'package:devpizzaria/datas/car_data.dart';
import 'package:devpizzaria/datas/product_datas.dart';
import 'package:devpizzaria/models/cart_models.dart';
import 'package:devpizzaria/models/user_models.dart';
import 'package:devpizzaria/screens/car.dart';
import 'package:devpizzaria/screens/login_screen.dart';
import 'package:flutter/material.dart';

class InfoScreen extends StatefulWidget {

  final ProductData productData;

  const InfoScreen({Key key, this.productData}) : super(key: key);

  @override
  _InfoScreenState createState() => _InfoScreenState(productData);
}

class _InfoScreenState extends State<InfoScreen> {

  final ProductData productData;

  _InfoScreenState(this.productData);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(productData.title),
        centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(16.0),
            child:  AspectRatio(
              aspectRatio: 0.9,
              child: Carousel(
                images: [productData.image],
                dotSize: 4.0,
                dotSpacing: 15.0,
                dotBgColor: Colors.red,
                dotColor: Colors.red,
                autoplay: false,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text(productData.title,
                style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black
                  ),
                ),
                Text("R\$ ${productData.preco.toStringAsFixed(2)}",
                style: TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.w400,
                  color: Colors.black26,
                ),
                ),
                Divider(height: 20.0,color: Colors.black,),
                const SizedBox(height: 16.0,),
                Text(productData.descricao,
                style: TextStyle(
                  fontSize: 20.0
                  ),
                ),
                Divider(),
                const SizedBox(height: 16.0,),
                FlatButton(
                  color: Colors.red,
                  splashColor: Colors.black,
                  padding: EdgeInsets.only(top: 14.0, bottom: 14.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  onPressed: (){
                    if(UserModel.of(context).isLoggedIn()){

                      CartProduct cartProduct = CartProduct();
                      cartProduct.quantity = 1;
                      cartProduct.pid = productData.id;

                      CartModel.of(context).addCartItem(cartProduct);

                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => CarScreen()
                      ));
                    }
                    else{
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context)=>LoginScreen()
                      ));
                    }
                  },
                    child: Text( UserModel.of(context).isLoggedIn()
                        ? "Adicionar ao carrinho"
                    : "Entre para comprar",
                      style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}