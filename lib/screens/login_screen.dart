import 'package:devpizzaria/models/user_models.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import 'cadastro_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

final _scaffoldKey = GlobalKey<ScaffoldState>();

final _focusSenha = FocusNode();
final _emailController= TextEditingController();
final _senhaController = TextEditingController();


class _LoginScreenState extends State<LoginScreen> {

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        key: _scaffoldKey,
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
                          controller: _emailController,
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
                          controller: _senhaController,
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
                            model.signIn(
                              email: _emailController.text,
                              pass: _senhaController.text,
                              onSuccess: _onSuccess,
                              onFail: _onFail,
                            );
                          },
                        ),
                        const SizedBox(height: 20.0,),
                        GestureDetector(
                          onTap: (){
                            if(_emailController.text.isEmpty){
                              _scaffoldKey.currentState.showSnackBar( SnackBar(
                                content: Text("Insira seu e-mail para recupareção",),
                                backgroundColor: Colors.red,
                                duration: Duration(seconds: 2,),
                              ));
                            }
                            else {
                              model.recoverPass(_emailController.text);
                              _scaffoldKey.currentState.showSnackBar( SnackBar(
                                content: Text("Confira seu e-mail",),
                                backgroundColor: Colors.red,
                                duration: Duration(seconds: 2,),
                              ));
                            }
                          },
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

  void _onSuccess(){
    Navigator.of(context).pop();
  }

  void _onFail(){
    _scaffoldKey.currentState.showSnackBar( SnackBar(
      content: Text("Falha ao entrar ",),
      backgroundColor: Colors.red,
      duration: Duration(seconds: 2,),
    ));
  }
}