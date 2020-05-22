import 'package:devpizzaria/datas/product_datas.dart';
import 'package:devpizzaria/widgtes/product_tile.dart';
import 'package:flutter/material.dart';

class LaunchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Lanches"),
          centerTitle: true,
          bottom: TabBar(
            indicatorColor: Colors.white,
            tabs: <Widget>[
              Tab(icon: Icon(Icons.grid_on,),child: Text("Lanches de carne",),),
              Tab(icon: Icon(Icons.list,),child: Text("Lanches de frango",),),
            ],
          ),
        ),
        body: TabBarView(
          physics: NeverScrollableScrollPhysics(),
          children: <Widget>[
            GridView.count(
                  crossAxisCount: 2,
                  mainAxisSpacing:4.0,
                  crossAxisSpacing: 4.0,
                  childAspectRatio: 0.65,
              children: <Widget>[
                ProductTile(
                  data: ProductData.document(
                      "Hamburger",
                      Image.asset("images/lanche.jpg",fit: BoxFit.cover),
                      "Hamburger",
                      16.0,
                    "Lanche feito de Hamburger, queijo e salada",
                  ),
                ),
              ],
            ),
            GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 4.0,
                crossAxisSpacing: 4.0,
                childAspectRatio: 0.65,
              children: <Widget>[
                ProductTile(
                  data: ProductData.document(
                    "Hamburger Frango",
                    Image.asset("images/lanche.jpg",fit: BoxFit.cover),
                    "Hamburger Frango",
                    16.0,
                    "Lanche feito de frango, queijo e salada",
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