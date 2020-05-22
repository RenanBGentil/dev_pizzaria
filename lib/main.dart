import 'package:devpizzaria/models/cart_models.dart';
import 'package:devpizzaria/models/user_models.dart';
import 'package:devpizzaria/screens/car.dart';
import 'package:devpizzaria/screens/home.dart';
import 'package:devpizzaria/screens/login_screen.dart';
import 'package:devpizzaria/screens/produtos_screen.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';


void main()=>runApp(MyApp());

final border = OutlineInputBorder(
  borderRadius: BorderRadius.circular(32.0),
  borderSide: BorderSide(
    color: Colors.red,
  ),
);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  ScopedModel<UserModel>(
      model: UserModel(),
      child: ScopedModelDescendant<UserModel>(
        builder: (context, child, model){
          return ScopedModel<CartModel>(
            model: CartModel(model),
            child: MaterialApp(
              title: "Pizzaria",
              routes: {
                'home':(context) => Home(),
                'car' : (context) => CarScreen(),
                'login': (context) => LoginScreen(),
                'produtos':(context) => ProdutoScreen(),
              },
              theme: ThemeData(
                primaryColor: Colors.red,
                inputDecorationTheme: InputDecorationTheme(
                  enabledBorder: border,
                  border: border,
                ),
              ),
              home: Home(),
            ),
          );
        },
      ),
    );
  }
}