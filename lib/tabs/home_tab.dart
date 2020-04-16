import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class HomeTab extends StatefulWidget {
  @override
  _HomeTabState createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  @override
  Widget build(BuildContext context) {

    Widget _backColor<Color>() => Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.red,
            Colors.black,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
    );

    return Stack(
              children: <Widget>[
                _backColor(),
                CustomScrollView(
                  slivers: <Widget>[
                    SliverAppBar(
                      title: Text("Novidades"),
                      centerTitle: true,
                      elevation: 0.0,
                    ),
                    SliverToBoxAdapter(
                      child:  Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          Container(child: Image.asset('images/pizza.jpg',fit: BoxFit.cover, height: 300.0,),),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Container(child: Image.asset('images/pizza2.jpg',fit: BoxFit.cover, height: 140.0,),),
                              Container(child: Image.asset('images/pizza3.jpg',fit: BoxFit.cover,  height: 140.0,),),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(200.0, 30.0, 0.0, 0.0),
                            child:FloatingActionButton(
                              backgroundColor: Colors.red,
                              child: Icon(
                                  Icons.add_shopping_cart
                              ),
                              onPressed: () {
                                Navigator.pushNamed(context, 'car');
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
      );
  }
}