import 'package:devpizzaria/models/user_models.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class CadastroScreen extends StatefulWidget {
  @override
  _CadastroScreenState createState() => _CadastroScreenState();
}

class _CadastroScreenState extends State<CadastroScreen> {

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  final _Nomecontroller = TextEditingController();
  final _Emailcontroller = TextEditingController();
  final _Senhacontroller = TextEditingController();
  final _Endcontroller = TextEditingController();

  final _focusEmail = FocusNode();
  final _focusSenha = FocusNode();
  final _focusEnd = FocusNode();



  @override
  void dispose() {
    _Nomecontroller.dispose();
    _Emailcontroller.dispose();
    _Senhacontroller.dispose();
    _Endcontroller.dispose();
    _focusEmail.dispose();
    _focusSenha.dispose();
    _focusEnd.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){FocusScope.of(context).unfocus();},
      child: Scaffold(
        key: _scaffoldKey,
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
  void _onSuccess(){
    _scaffoldKey.currentState.showSnackBar( SnackBar(
      content: Text("Usuário criado com sucesso",),
      backgroundColor: Colors.red,
      duration: Duration(seconds: 2,),
    ));
    Future.delayed(Duration(seconds: 2,)).then((_){
      Navigator.of(context).pop();
    });
  }

  void _onFail(){
    _scaffoldKey.currentState.showSnackBar( SnackBar(
      content: Text("Falha ao criar usuário ",),
      backgroundColor: Colors.red,
      duration: Duration(seconds: 2,),
    ));
  }
}
