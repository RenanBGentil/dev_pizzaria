import 'package:devpizzaria/models/user_models.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import 'cadastro_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}
final _focusSenha = FocusNode();
final _textControllerup = TextEditingController();
final _textControllerdouwn = TextEditingController();


class _LoginScreenState extends State<LoginScreen> {

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text("Login"),
          centerTitle: true,
          actions: <Widget>[
            FlatButton(
              child: Text("Cadastre-se",style: TextStyle(
                color: Colors.white,
                ),
              ),
              onPressed: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>CadastroScreen()));
              },
            ),
          ],
        ),
        body:Padding(
          padding: EdgeInsets.all(22.0),
          child: ListView(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(0.0, 50.0, 0.0, 20.0),
                child: ScopedModelDescendant<UserModel>(
                  builder: (context, child, model){
                    if(model.isLoading)
                      return Center(child: CircularProgressIndicator(),);

                    return  Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        TextField(
                          onSubmitted: (_){
                            FocusScope.of(context).requestFocus(_focusSenha);
                          },
                          controller: _textControllerup,
                          decoration: InputDecoration(
                            labelText: "E-mail",
                          ),
                        ),
                        const SizedBox(height: 20.0,),
                        TextField(
                          onSubmitted: (_){
                            FocusScope.of(context).unfocus();
                          },
                          focusNode: _focusSenha,
                          controller: _textControllerdouwn,
                          obscureText: true,
                          decoration: InputDecoration(
                            labelText: "Senha",
                          ),
                        ),
                        const SizedBox(height: 50.0,),
                        FlatButton(
                          child: Text("Entrar",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 138.0,),
                          color: Colors.red,
                          onPressed: (){
                            model.signIn();
                          },
                        ),
                        const SizedBox(height: 20.0,),
                        GestureDetector(
                          onTap: (){},
                          child: Text("Esqueci minha senha",
                            style: TextStyle(
                              color: Colors.blue,
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}