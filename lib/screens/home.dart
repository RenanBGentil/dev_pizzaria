import 'package:devpizzaria/screens/produtos_screen.dart';
import 'package:devpizzaria/tabs/home_tab.dart';
import 'package:devpizzaria/widgtes/custom_drawer.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return PageView(
      physics: NeverScrollableScrollPhysics(),
      controller: _pageController,
    children: <Widget>[
      Scaffold(
        drawer: CustomDrawer(pageController: _pageController,),
        body: HomeTab(),
      ),
      Scaffold(
        appBar:AppBar (
          title: Text("Produtos"),
          centerTitle: true,
        ),
        drawer: CustomDrawer(pageController: _pageController,),
        body: ProdutoScreen(),
      ),
      ],
    );
  }
}
