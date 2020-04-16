import 'package:devpizzaria/datas/product_datas.dart';
import 'package:devpizzaria/widgtes/product_tile.dart';
import 'package:flutter/material.dart';


class PizzaScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 1,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Pizzas"),
          centerTitle: true,
          bottom: TabBar(
            indicatorColor: Colors.white,
            tabs: <Widget>[
              Tab(icon: Icon(Icons.grid_on),),
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
                      "Pizza",
                      Image.asset("images/pizza.jpg",fit: BoxFit.cover,),
                      "Pizza",
                      20.0,
                    "Pizza de mussarela com azeitona",
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
