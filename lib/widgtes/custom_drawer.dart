import 'package:flutter/material.dart';
import 'drawer_tile.dart';

class CustomDrawer extends StatelessWidget {

  final PageController pageController;

  const CustomDrawer({Key key, this.pageController}) : super(key: key);

  Widget _backDrawer()=> Container(
    decoration: BoxDecoration(
      gradient: LinearGradient(
        colors: [
          Colors.redAccent,
          Colors.black12,
        ],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ),
    ),
  );


  @override
  Widget build(BuildContext context) {
    return Drawer(
      child:Stack(
        children: <Widget>[
          _backDrawer(),
          ListView(
            padding: EdgeInsets.only(left:32.0,top:16.0),
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(bottom: 8.0),
                padding: EdgeInsets.fromLTRB(0.0, 16.0, 16.0, 0.0),
                height: 170.0,
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      top: 8.0,
                      left: 0.0,
                      child: Text("Dev Pizzaria",
                        style: TextStyle(fontSize: 34.0,fontWeight: FontWeight.bold,),
                      ),
                    ),
                    Positioned(
                      bottom:0.0,
                      left:0.0,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text("Ola",
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          GestureDetector(
                            onTap: (){
                              Navigator.of(context).pop();
                              Navigator.pushNamed(context, 'login');
                            },
                            child: Text("Entre ou Cadastre - se >",
                              style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Divider(),
              DrawerTile(icon: Icons.home, text: "Inicio",pageController: pageController,page: 0,),
              DrawerTile(icon: Icons.list, text: "Produtos",pageController: pageController,page: 1,),
              DrawerTile(icon: Icons.location_on, text: "Lojas",pageController: pageController,page: 2,),
              DrawerTile(icon: Icons.playlist_play,text: "meus pedidos",pageController: pageController,page: 3,),
            ],
          ),
        ],
      ),
    );
  }
}