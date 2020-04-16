import 'package:devpizzaria/datas/product_datas.dart';
import 'package:devpizzaria/widgtes/product_tile.dart';
import 'package:flutter/material.dart';


class CategoryScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 1,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Bebidas"),
          centerTitle: true,
          bottom:TabBar(
            indicatorColor: Colors.white,
            tabs: <Widget>[
              Tab(icon: Icon(Icons.grid_on,),),
            ],
          ),
        ),
        body: TabBarView(
          physics: NeverScrollableScrollPhysics(),
          children: <Widget>[
            GridView.count(
              padding: EdgeInsets.all(14.0),
                  crossAxisCount: 2,
                  mainAxisSpacing:4.0,
                  crossAxisSpacing: 4.0,
                  childAspectRatio: 0.65,
                  children: <Widget>[
               ProductTile(
                 data: ProductData.document(
                     "Guarana Antartica",
                   Image.asset("images/antartica.jpg",fit: BoxFit.cover,),
                     "Guarana",
                     1.50,
                   "Refrigerante de Guarana, 600 ml",
                 ),
                          ),
                  ],
            ),
          ],
        ),
      ),
    );
  }
}