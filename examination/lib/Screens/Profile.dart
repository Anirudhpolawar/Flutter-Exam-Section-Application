import 'package:examination/Models/Student.dart';
import 'package:examination/Models/operations.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
  
}

class _ProfileState extends State<Profile> {
  int gr;
  Operation op = new Operation();
  Student s;
  _ProfileState()
  {
    s = null;
    load();
  }

  void load()async{
    await op.fetch();
    setState(() {
      
    });

  }



  
  Widget listview()
{
  if(s == null)
    {
        return Material(
                    elevation: 14.0,
                    borderRadius: BorderRadius.circular(24.0),
                    shadowColor: Color(0x802196F3),
                  child:Center(
                    child: Column(
                      children: <Widget>[
                        Row(
                          children : <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Icon(Icons.data_usage,size:40),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("no Data",style: TextStyle(fontSize:40),),
                            ),
                            
                          ]
                        ),
                      ],
                    ),
                  ),
          );
    }
    else
    {
        return Material(
                elevation: 40.0,
                borderRadius: BorderRadius.circular(24.0),
                shadowColor: Color(0x802196F3),
                child:Column(
                  children:<Widget>[
                     Icon(Icons.history,size: 30.0,),
                       Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Text("History",style: TextStyle(fontSize:20),),
                            ),
                             Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Text("First name : ${s.firstname}",style: TextStyle(fontSize:20),),
                            ),
                             Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Text("Middle name : ${s.middlename}",style: TextStyle(fontSize:20),),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Text("Last name : ${s.lastname}",style: TextStyle(fontSize:20),),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Text("CPI : ${s.cpi}",style: TextStyle(fontSize:20),),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Text("GR : ${s.grnumber}",style: TextStyle(fontSize:20),),
                            ),
                             Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Text("Suject Details : ",style: TextStyle(fontSize:20),),
                            ),
                    Container(
                      height: 300,
                      child: ListView.builder(
                  padding: const EdgeInsets.all(20),
                  itemCount: s.subjectCodes.length,
                itemBuilder: (context, position) {
                  return Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      elevation: 40.0,
                      child: Row(
                        children: <Widget>[
                          Container(
                            child: Row(
                              children: <Widget>[
                                Icon(Icons.account_balance,size: 30.0,),
                                        Padding(
                                          padding: const EdgeInsets.all(4.0),
                                          child: Text("Suject Code : ${s.subjectCodes[position]}", style: TextStyle(fontSize: 15.0),),
                                        ),
                                        Container(
                                          width: 120,
                                          child: Padding(
                                            padding: const EdgeInsets.all(4.0),
                                            child: Text("Marks : ${s.marks[position]}", style: TextStyle(fontSize: 15.0),),
                                          ),
                                        ),
                                      Padding(
                                      padding: const EdgeInsets.only(left: 20.0),
                                      child: Text("Grade : ${s.grade[position]}", style: TextStyle(fontSize: 15.0,color: Colors.red)),
                                    ),
                                     Padding(
                                      padding: const EdgeInsets.only(left:40.0),
                                      child: Text("Suject weigth : ${s.subjectpoint[position]}", style: TextStyle(fontSize: 15.0,color: Colors.limeAccent),),
                                    ), 
                                      ],
                                    ),    
                          ),
                        
                        ],
                      ),
                  );
                },
          ),
                    ),                
                  ],
                ) 
        ); 
    }
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text("Student Profile"),
      ),
      body: Center(
        child:Column(children: <Widget>[
          Padding(padding: EdgeInsets.only(bottom:20)),
          Container(
            width: 150,
            child: TextField(
              keyboardType: TextInputType.number,
              onChanged: (value){
                print(value);
                gr = int.parse(value);
              },
              style: TextStyle(
                fontSize: 20,
              ),
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                hintText : "GR Number",
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
                 s = op.getprofile(gr);
                 setState(() {
                   
                 });
             },
             child: Text("Show"),
            shape: new RoundedRectangleBorder(
                                                borderRadius: new BorderRadius.circular(18.0),
                                                side: BorderSide(color: Colors.blue)
                                              ),
           ),

           listview(),
           
        ],)
      ),
      
    );
  }
}