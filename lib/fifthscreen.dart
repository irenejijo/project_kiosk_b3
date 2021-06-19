import 'package:flutter/material.dart';

class FifthScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xff000000),
        leading: Icon(Icons.list),
        title: Text("About"),
      ),
      body: Center(
          child: Column(children: [
        ListTile(
          leading: Icon(Icons.ac_unit),
          title: Text(
            'STAY HOME, STAY SAFE',
          ),
        ),
        ListTile(
          leading: Icon(Icons.ac_unit),
          title: Text(
            'A Covid symptom tracker which uses temperature to identify cases to be quarantine',
          ),
        ),
        ListTile(
          leading: Icon(Icons.ac_unit),
          title: Text(
            'Wear a mask that covers your nose and mouth to help protect yourself and others',
          ),
        ),
        ListTile(
          leading: Icon(Icons.ac_unit),
          title: Text(
            'Stay 6 feet apart from others who don’t live with you',
          ),
        ),
        ListTile(
          leading: Icon(Icons.ac_unit),
          title: Text(
            'Get a COVID-19 vaccine when it is available to you',
          ),
        ),
        ListTile(
          leading: Icon(Icons.ac_unit),
          title: Text(
            'Avoid crowds and poorly ventilated indoor spaces',
          ),
        ),
        ListTile(
          leading: Icon(Icons.ac_unit),
          title: Text(
            'Wash your hands often with soap and water. Use hand sanitizer if soap and water aren’t available',
          ),
        ),
      ])),
    );
  }
}
