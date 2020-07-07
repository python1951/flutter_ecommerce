import 'package:flutter/material.dart';
import 'package:fluttercoursee/pages/products.dart';
import './product.dart';

class Auth extends StatefulWidget {
  @override
  _AuthState createState() => _AuthState();
}

class _AuthState extends State<Auth> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
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
    return TextFormField(
      validator: (value){
        if (value.isEmpty || !value.trimRight().contains("@")){
          return ("Please provide a valid email accout!");

        }
        return null;

      }
      ,
      decoration: InputDecoration(labelText: "Email",filled: true,fillColor: Colors.white,),
      keyboardType: TextInputType.emailAddress,
      
      onSaved: (String value) {
        emailValue = value;
      },
    );
  }


  Widget _buildPasswordField(){
    return TextFormField(
      validator: (value){
        if (value.isEmpty || value.length<8 || !value.contains(new RegExp("^(?=.*[A-Z].*[A-Z])(?=.*[0-9].*[0-9]).{8}"))){
          return "Please provide a valid password ";
        }
        return null;
      },
      decoration: InputDecoration(labelText: "Password",fillColor: Colors.white,filled: true),
      obscureText: _obscure,
      onSaved: (String value) {
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
    if (!_formKey.currentState.validate()){
      return;
    }
    //_formKey.currentState.save();
    
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
              child: Form(
                key: _formKey,
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
            ),

      );
  }
}
