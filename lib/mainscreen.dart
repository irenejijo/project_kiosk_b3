
import 'package:flutter/material.dart';
import 'secondscreen.dart';
import 'thirdscreen.dart';
import 'fourthscreen.dart';
import 'fifthscreen.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreen createState() => _MainScreen();
}

class _MainScreen extends State<MainScreen> {

  

  
@override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Color(0xff000000),
          title: Text('Kiosk Data'),
          textTheme: Theme.of(context).textTheme.apply(
                bodyColor: Colors.white,
              ),
        ),
        drawer: Drawer(
          child: ListView(
            children: <Widget>[
              Container(
                child: UserAccountsDrawerHeader(
                  currentAccountPicture: CircleAvatar(
                    backgroundImage: NetworkImage(
                      "https://flutterx.com/thumbnails/artifact-1?clear_cache=1"
                      ),
                    backgroundColor: Color(0xff00BCD5),
                  ),
                  accountName: Text(
                    "Kiosk Data",
                  ),
                  accountEmail: Text(
                    "kiosk.b3@gmail.com",
                  ),
                ),
              ),
              ListTile(
                title: Text('Data'),
                leading: Icon(Icons.folder),
                onTap: () {
                  
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SecondScreen()),
                  );
                },
              ),
              ListTile(
                title: Text('Search'),
                leading: Icon(Icons.people),
                onTap: () {

                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ThirdScreen()),
                  );
                },
              ),
              ListTile(
                title: Text('Statistics'),
                leading: Icon(Icons.star),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => FourthScreen()),
                  );
                },
              ),
              ListTile(
                title: Text('About'),
                leading: Icon(Icons.details),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => FifthScreen()),
                  );
                },
              ),
            ],
          ),
        ),
        body: Container(
            constraints: BoxConstraints.expand(),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/2.jpg"),
                    fit: BoxFit.cover)),
            child: new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    'assets/images/c.jpg',
                    height: 400,
                    width: 800,
                  ),
                  new ElevatedButton(
                    child: Text(
                      "Data",
                      textAlign: TextAlign.justify,
                    ),
                    style: ElevatedButton.styleFrom(
                        onPrimary: Colors.blueGrey,
                        primary: Colors.white,
                        onSurface: Colors.grey,
                        side: BorderSide(color: Colors.black, width: 1),
                        padding: EdgeInsets.symmetric(
                            vertical: 30, horizontal: 185)),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SecondScreen()),
                      );
                    },
                  ),
                  new ElevatedButton(
                    child: Text(
                      "Search ",
                      textAlign: TextAlign.center,
                      textDirection: TextDirection.rtl,
                    ),
                    style: ElevatedButton.styleFrom(
                        onPrimary: Colors.blueGrey,
                        primary: Colors.white,
                        onSurface: Colors.grey,
                        side: BorderSide(color: Colors.black, width: 1),
                        padding: EdgeInsets.symmetric(
                            vertical: 30, horizontal: 175)),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ThirdScreen()),
                      );
                    },
                  ),
                  new ElevatedButton(
                    child: Text(
                      "Statistics",
                    ),
                    style: ElevatedButton.styleFrom(
                        onPrimary: Colors.blueGrey,
                        primary: Colors.white,
                        onSurface: Colors.grey,
                        side: BorderSide(color: Colors.black, width: 1),
                        padding: EdgeInsets.symmetric(
                            vertical: 30, horizontal: 180)),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => FourthScreen()),
                      );
                    },
                  ),
                ])
                
                
                )
                
               
                );
  }
}
