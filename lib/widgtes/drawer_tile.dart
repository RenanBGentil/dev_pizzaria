import 'package:flutter/material.dart';

class DrawerTile extends StatelessWidget {

  final IconData icon;
  final String text;
  final PageController pageController;
  final int page;

  const DrawerTile({Key key, this.icon, this.text, this.pageController, this.page}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black12,
      child: InkWell(
        onTap: (){
          Navigator.of(context).pop();
          pageController.jumpToPage(page);
        },
        child: Container(
          height: 60.0,
          child: Row(
            children: <Widget>[
              Icon(icon ?? Icons.home,
                size: 32.0,
                color: pageController.page.round() == page ?Colors.black: Colors.white,
              ),
              Text(text ?? "Inicio",
                style: TextStyle(fontSize: 16.0,
                  color: pageController.page.round() == page ?Colors.black: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
