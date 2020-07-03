import 'package:flutter/material.dart';
import 'package:fluttercoursee/pages/products.dart';
import './product.dart';

class Auth extends StatefulWidget {
  @override
  _AuthState createState() => _AuthState();
}

class _AuthState extends State<Auth> {
  bool acceptTerms = true;
  String emailValue = '';
  String passValue = '';
  bool _obscure = true;
  bool _acceptTerms = false;
  DecorationImage _buildBackgroundImage(){
    return DecorationImage(
        image: AssetImage("images/background.jpg"),
        fit: BoxFit.cover,
        colorFilter: ColorFilter.mode(
            Colors.black.withOpacity(0.5), BlendMode.dstATop)
    );
  }

  Widget _buildEmailTextField(){
    return TextField(
      decoration: InputDecoration(labelText: "Email",filled: true,fillColor: Colors.white,),
      keyboardType: TextInputType.emailAddress,
      onChanged: (String value) {
        emailValue = value;
      },
    );
  }


  Widget _buildPasswordField(){
    return TextField(
      decoration: InputDecoration(labelText: "Password",fillColor: Colors.white,filled: true),
      obscureText: _obscure,
      onChanged: (String value) {
        setState(() {
          passValue = value;
        });
      },
    );
  }


  Widget _buildSwitchTile(){
    return
      SwitchListTile(
          value: _acceptTerms,
          title: Text("Accept Terms"),
          onChanged: (bool value) {
            setState((){
              _acceptTerms = value;
            });
          }
      );
  }

  void _buildSubmitForm(){
    Navigator.pushNamed(context, '/admin');
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.deepOrange,
          brightness: Brightness.light,
          accentColor: Colors.purple,
        ),
        home: Scaffold(
          appBar: AppBar(
            title: Text("Log-in"),
          ),
          body: Container(
            alignment: Alignment.center,
              decoration: BoxDecoration(
                  image:_buildBackgroundImage()
              ),
              child: SingleChildScrollView(
                child: Container(
                  width: MediaQuery.of(context).size.width*0.9,
                  child: Column(
                  children: <Widget>[
                  _buildEmailTextField(),

                    SizedBox(height: 10.0,),
                    _buildPasswordField(),
                    _buildSwitchTile(),
                    SizedBox(height: 2.0,),
                    RaisedButton(
                      color: Theme.of(context).accentColor,
                      child: Text(
                        "Login",
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed:_buildSubmitForm,
                    )
                  ],
              ),
              ),
                ),
            ),
            ),

      );
  }
}
