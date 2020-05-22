import 'package:devpizzaria/widgtes/custom_hearder.dart';
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
      child: Stack(
        children: <Widget>[
          _backDrawer(),
          CustomHeader(),
          Container(
            padding: EdgeInsets.only(top: 154.0),
            child: ListView(
              padding: EdgeInsets.only(left:32.0,top:16.0),
              children: <Widget>[
                Divider(),
                DrawerTile(icon: Icons.home, text: "Inicio",pageController: pageController,page: 0,),
                DrawerTile(icon: Icons.list, text: "Produtos",pageController: pageController,page: 1,),
                DrawerTile(icon: Icons.location_on, text: "Lojas",pageController: pageController,page: 2,),
                DrawerTile(icon: Icons.playlist_play,text: "meus pedidos",pageController: pageController,page: 3,),
              ],
            ),
          ),
        ],
      ),
    );
  }
}