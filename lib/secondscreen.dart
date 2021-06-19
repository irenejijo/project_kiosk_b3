import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

Map<dynamic, dynamic> newData;
var db = FirebaseDatabase.instance.reference();

class SecondScreen extends StatefulWidget {
  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    final _kTabPages = <Widget>[
      Container(
          child: DataTableExample(
        location: 'a',
      )),
      Container(
          child: DataTableExample(
        location: 'b',
      )),
      Container(
          child: DataTableExample(
        location: 'c',
      )),
    ];
    final _kTabs = <Tab>[
      const Tab(icon: Icon(Icons.location_city), text: 'Location A'),
      const Tab(icon: Icon(Icons.location_city), text: 'Location B'),
      const Tab(icon: Icon(Icons.location_city), text: 'Location c'),
    ];
    return DefaultTabController(
      length: _kTabs.length,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Kiosk'),
          centerTitle: true,
          backgroundColor: Color(0xff000000),
          leading: Icon(Icons.list),

          // If `TabController controller` is not provided, then a
          // DefaultTabController ancestor must be provided instead.
          // Another way is to use a self-defined controller, c.f. "Bottom tab
          // bar" example.
          bottom: TabBar(
            tabs: _kTabs,
          ),
        ),
        body: TabBarView(
          children: _kTabPages,
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class DataTableExample extends StatefulWidget {
  String location;
  DataTableExample({this.location});
  @override
  _DataTableExampleState createState() =>
      _DataTableExampleState(location: location);
}

class _DataTableExampleState extends State<DataTableExample> {
  String location;
  _DataTableExampleState({this.location});
  List<DataRow> _tableRow;
  @override
  Widget build(BuildContext context) {
    db.child('B3').onValue.listen((Event event) {
      Map<dynamic, dynamic> val = event.snapshot.value;
      var rows = val.values
          .where((element) => element['Location'] == location)
          .map((e) => DataRow(cells: [
                DataCell(Text(e['Name'])),
                DataCell(Text(e['Phone'])),
                DataCell(Text(e['Temperature'].toString())),
              ]))
          .toList();
      if (this.mounted) {
        setState(() {
          _tableRow = rows;
        });
      }
    });

    return Container(
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DataTable(
              columns: kTableColumns,
              rows: _tableRow ?? [],
            ),
          ],
        ),
      ),
    );
  }
}

////// Columns in table.
const kTableColumns = <DataColumn>[
  DataColumn(
    label: Text('Name'),
  ),
  DataColumn(
    label: Text('Mobile Number'),
  ),
  DataColumn(
    label: Text('Temperature (in Celsius)'),
  ),
];
