import 'package:devpizzaria/models/user_models.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class CustomHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DrawerHeader(
      child: Container(
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
              child: ScopedModelDescendant<UserModel>(builder: (context,child,model){
                print(model.isLoading);
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("Ola ${!model.isLoggedIn() ? "" : model.userData["name"]}",
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        if(!model.isLoading)
                        Navigator.pushNamed(context, 'login');
                        else model.signOut;
                      },
                      child: Text(
                        !model.isLoading?
                        "Entre ou Cadastre - se >":
                        "sair",
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}