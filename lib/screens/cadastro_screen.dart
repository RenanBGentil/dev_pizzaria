import 'dart:convert';

import 'package:devpizzaria/models/user_models.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class CadastroScreen extends StatefulWidget {
  @override
  _CadastroScreenState createState() => _CadastroScreenState();
}

class _CadastroScreenState extends State<CadastroScreen> {

  final _Nomecontroller = TextEditingController();
  final _Emailcontroller = TextEditingController();
  final _Senhacontroller = TextEditingController();
  final _Confirmacontroller = TextEditingController();
  final _Endcontroller = TextEditingController();

  final _focusEmail = FocusNode();
  final _focusSenha = FocusNode();
  final _focusConfirma = FocusNode();
  final _focusEnd = FocusNode();

  String infoText="";

  void Validator(){
    setState(() {
      if(_Senhacontroller != _Confirmacontroller){
        infoText = "As senhas digitadas são diferentes";
      }
    });
  }

  @override
  void dispose() {
    _Nomecontroller.dispose();
    _Emailcontroller.dispose();
    _Senhacontroller.dispose();
    _Confirmacontroller.dispose();
    _Endcontroller.dispose();
    _focusEmail.dispose();
    _focusSenha.dispose();
    _focusConfirma.dispose();
    _focusEnd.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){FocusScope.of(context).unfocus();},
      child: Scaffold(
        appBar: AppBar(
          title: Text("Cadastre - se"),
          centerTitle: true,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.clear),
              onPressed: (){
                _Nomecontroller.clear();
                _Emailcontroller.clear();
                _Senhacontroller.clear();
                _Confirmacontroller.clear();
              },
            ),
          ],
        ),
        body: ScopedModelDescendant<UserModel>(
          builder: (context, child, model){
            if(model.isLoading) return Center(child: CircularProgressIndicator(),);
            return ListView(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left:16.0, right: 16.0, top: 40.0,),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[

                      TextField(
                        decoration: InputDecoration(
                          labelText: "Nome Completo",
                        ),
                        controller: _Nomecontroller,
                        onSubmitted: (_){
                          FocusScope.of(context).requestFocus(_focusSenha);
                        },
                      ),

                      const SizedBox(height: 20.0,),


                      TextField(
                        decoration: InputDecoration(
                          labelText: "Email",
                        ),
                        controller: _Emailcontroller,
                        focusNode: _focusEmail,
                        onSubmitted: (_){
                          FocusScope.of(context).requestFocus(_focusEnd);
                        },
                      ),

                      const SizedBox(height: 20.0,),

                      TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: "Endereço",
                        ),
                        controller: _Endcontroller,
                        focusNode: _focusEnd,
                        onSubmitted: (_){
                          FocusScope.of(context).requestFocus(_focusSenha);
                        },
                      ),


                      const SizedBox(height: 20.0,),

                      TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: "Senha",
                        ),
                        controller: _Senhacontroller,
                        focusNode: _focusSenha,
                        onSubmitted: (_){
                          FocusScope.of(context).requestFocus(_focusConfirma);
                        },
                      ),

                      const SizedBox(height: 20.0,),

                      TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: "Confirmar Senha",
                        ),
                        controller: _Confirmacontroller,
                        focusNode: _focusConfirma,
                        onSubmitted: (_){
                          FocusScope.of(context).unfocus();
                        },
                      ),

                      const SizedBox(height: 20.0,),

                      FlatButton(
                        child: Text("Cadastrar",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.0,
                          ),
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        padding: EdgeInsets.only(top: 14.0, bottom: 14.0),
                        color: Colors.red,
                        onPressed: (){
                          Validator();

                          Map<String, dynamic> userData = {
                                "nome":_Nomecontroller.text,
                                "email":_Emailcontroller.text,
                                "endereço":_Endcontroller.text,
                          };

                          model.signUp(
                              userData: userData,
                              pass: _Senhacontroller.text,
                              onSucess: _onSuccess,
                              onFail: _onFail,
                          );
                        },
                      ),
                      Text(infoText, style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22.0,
                      ),),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
void _onSuccess(){}

void _onFail(){}