import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

Map<dynamic, dynamic> newData;
var db = FirebaseDatabase.instance.reference();

class ThirdScreen extends StatefulWidget {
  @override
  _ThirdScreenState createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  String data;
  Map<dynamic, dynamic> val ={};
  List<dynamic> filterVal = [];
  @override
  Widget build(BuildContext context) {
    db.child('B3').onValue.listen((Event event) {
      val = event.snapshot.value;
    });

    FilterData() {
     List<Widget> dataVal() {
       print(data);
       if(data!= null){
         filterVal = val.values
             .where((element) => element['Phone'] == data).toList();
       }else{
         filterVal=val.values.map((e) => e).toList();
       }
      return  filterVal.map((e) => Card(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Name: ${e['Name']}',style: TextStyle(fontSize: 20.0),),
                Text('Location: ${e['Location']}',style: TextStyle(fontSize: 20.0),),
                Text('Temperature: ${e['Temperature'].toString()}',style: TextStyle(fontSize: 20.0),),
              ],
            ),
        ),
      )).toList();
      }
      return Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children:dataVal()??[Text("No Data Available")],
          ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xff000000),
        leading: Icon(Icons.list),
        title: Text("Search"),
      ),
      body: Container(
        child: SingleChildScrollView(
          scrollDirection:Axis.vertical,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  onSubmitted: (text){
                    setState(() {
                      data=text;
                    });
                  },
                  decoration: new InputDecoration(
                    labelText: "Enter Phone Here",
                    icon: new Icon(Icons.search),
                    enabledBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: const BorderSide(
                        color: Colors.grey,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                  ),
                ),
              ),
              FilterData(),
            ],
          ),
        ),
      ),
    );
  }
}

