import 'package:examination/Screens/Home.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text("Welcome to the VIT examination section"),
      ),
      body:Center(
       child:Column(
         children: <Widget>[
           Padding(padding: EdgeInsets.only(bottom:80)),
           Container(
             width: 250,
             height: 250,
             child: Image.asset("Data/vitlogo.png"),
           ),
           Padding(padding: EdgeInsets.only(bottom:20)),
          Container(
            width: 300,
            child: TextField(
              obscureText: true,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                hintText : "Password",
                border : OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(
                      color : Colors.amber,
                      style : BorderStyle.solid,
                    )
                )
              ),
            ),
          ),
           RaisedButton(
            color: Colors.blue,
             onPressed: (){
                  Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => Home()),
                                );
             },
             child: Text("Login"),
            shape: new RoundedRectangleBorder(
                                                borderRadius: new BorderRadius.circular(18.0),
                                                side: BorderSide(color: Colors.blue)
                                              ),
           )
         ]
       ) 
      )     
    );
  }
}