import 'package:examination/Models/operations.dart';
import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {

  Operation op = new Operation();
  String name;
  @override
  void initState() {
    // TODO: implement initState
     loadData();
    super.initState();
  }

  void loadData() async{
    await op.fetch();
    print("Load");
    setState(() {
      
    });
  }

Widget listview()
{
  if(op.students.isEmpty)
    {
        return Material(
                    color: Colors.white,
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
                              child: Text("Loading........",style: TextStyle(fontSize:40),),
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
               color: Colors.white,
                elevation: 40.0,
                borderRadius: BorderRadius.circular(24.0),
                shadowColor: Color(0x802196F3),
              child: Container(
                height: 500,
                child: ListView.builder(
                  padding: const EdgeInsets.all(20),
                  itemCount: op.students.length,
                itemBuilder: (context, position) {
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    elevation: 40.0,
                    child: Row(
                      children: <Widget>[
                        Container(
                          width: 800,
                          child: Row(
                            children: <Widget>[
                              Icon(Icons.account_circle,size: 40.0,),
                                      Container(
                                        width: 120,
                                        child: Padding(
                                          padding: const EdgeInsets.all(4.0),
                                          child: Text(op.students[position].firstname, style: TextStyle(fontSize: 20.0),),
                                        ),
                                      ),
                                      Container(
                                        width: 120,
                                        child: Padding(
                                          padding: const EdgeInsets.all(4.0),
                                          child: Text(op.students[position].middlename, style: TextStyle(fontSize: 20.0),),
                                        ),
                                      ),
                                    Padding(
                                    padding: const EdgeInsets.only(left: 20.0),
                                    child: Text("CPI : "+op.students[position].cpi.toStringAsFixed(2), style: TextStyle(fontSize: 15.0,color: Colors.red)),
                                  ),
                                   Padding(
                                    padding: const EdgeInsets.only(left:40.0),
                                    child: Text("GR : "+op.students[position].grnumber.toString(), style: TextStyle(fontSize: 15.0,color: Colors.limeAccent),),
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
        ); 
    }
}


  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title : Text("Search")
      ),
      body: Center(
        child: Column(children: <Widget>[

            Row(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(8.0),
                width: 200,
                child: TextField(
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    hintText : "name",
                    border : OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(
                          color : Colors.amber,
                          style : BorderStyle.solid,
                        )
                    )
                  ),
                  onChanged: (value){
                      name = value;
                      if(value.isEmpty == false && value != "")
                          op.sortByFirstname(name);
                      setState(() {
                        
                      });
                  },
                ),
          ),

          RaisedButton(
            color: Colors.blue,
             onPressed: (){
                 op.sortByCPI();
                 setState(() {
                   
                 });
             },
             child: Text("Sort CPI"),
            shape: new RoundedRectangleBorder(
                                                borderRadius: new BorderRadius.circular(18.0),
                                                side: BorderSide(color: Colors.blue)
                                              ),
           ),

              ],
            ),
          Padding(padding:EdgeInsets.all(8.0) ),
          // studentslistview(context),
          listview(),
         
        
        ],)
      ),
      
    );
  }
}