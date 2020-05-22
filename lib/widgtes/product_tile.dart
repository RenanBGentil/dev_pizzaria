import 'package:devpizzaria/datas/product_datas.dart';
import 'package:devpizzaria/screens/info_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class ProductTile extends StatelessWidget {

  final ProductData data;

  const ProductTile({Key key, this.data}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
            InkWell(
                 onTap: (){
                   Navigator.of(context).push(MaterialPageRoute(builder:
                       (context)=>InfoScreen(productData: data,)));
                 },
                splashColor: Colors.red,
                child:Card(
                  color: Colors.white30,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(5.0),
                        child: data.image??Image.asset(""),
                      ),
                      Text(data.title,style:
                      TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.w300
                        ),
                      ),
                      Text("preço: R\$ ${data.preco.toStringAsFixed(2)} ",
                        style: TextStyle(
                            fontSize: 20.0, fontWeight: FontWeight.bold
                        ),
                      ),
                    ],
                  ),
                ),
            ),
      ],
    );
  }
}