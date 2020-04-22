
import 'package:examination/Screens/Add.dart';
import 'package:examination/Screens/Change.dart';
import 'package:examination/Screens/Profile.dart';
import 'package:examination/Screens/Search.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text("Home"),
      ),
      body:Center(
       child:Column(
         children: <Widget>[
           Padding(padding: EdgeInsets.only(bottom:210)),
          
           RaisedButton(
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(18.0),
                        side: BorderSide(color: Colors.blue)),
                      onPressed: () {
                        Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => Add()),
                                );
                      },
                      color: Colors.blue,
                      textColor: Colors.white,
                      child: Text("Add new Entry".toUpperCase(),
                        style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold)),
                    ),
            RaisedButton(
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(18.0),
                        side: BorderSide(color: Colors.blue)),
                      onPressed: () {
                        Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => Search()),
                                );
                      },
                      color: Colors.blue,
                      textColor: Colors.white,
                      child: Text("Search".toUpperCase(),
                        style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold)),
                    ),
            RaisedButton(
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(18.0),
                        side: BorderSide(color: Colors.blue)),
                      onPressed: () {
                        Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => Profile()),
                                );
                      },
                      color: Colors.blue,
                      textColor: Colors.white,
                      child: Text("Profile".toUpperCase(),
                        style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold)),
                    ),
            RaisedButton(
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(18.0),
                        side: BorderSide(color: Colors.blue)),
                      onPressed: () {
                        Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => Change()),
                                );
                      },
                      color: Colors.blue,
                      textColor: Colors.white,
                      child: Text("Change Password".toUpperCase(),
                        style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold)),
                    ),
         ]
       ) 
      )     
    );
  }
}