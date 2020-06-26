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
          body: Center(
            child: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("images/background.jpg"),
                      fit: BoxFit.cover,
                      colorFilter: ColorFilter.mode(
                          Colors.black.withOpacity(0.5), BlendMode.dstATop))),
              padding: EdgeInsets.all(10.0),
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                  children: <Widget>[
                    TextField(
                      decoration: InputDecoration(labelText: "Email",filled: true,fillColor: Colors.white,),
                      keyboardType: TextInputType.emailAddress,
                      onChanged: (String value) {
                        emailValue = value;
                      },
                    ),

                    SizedBox(height: 10.0,),
                    TextField(
                      decoration: InputDecoration(labelText: "Password",fillColor: Colors.white,filled: true),
                      obscureText: _obscure,
                      onChanged: (String value) {
                        setState(() {
                          passValue = value;
                        });
                      },
                    ),
                    SwitchListTile(
                        value: _acceptTerms,
                        title: Text("Accept Terms"),
                        onChanged: (bool value) {
                          setState((){
                              _acceptTerms = value;
                          });
                        }
                    ),
                    SizedBox(height: 2.0,),
                    RaisedButton(
                      color: Theme.of(context).accentColor,
                      child: Text(
                        "Login",
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, '/admin');
                      },
                    )
                  ],
                ),
            ),
              ),
            ),
          ),
        ),
      );;
  }
}
