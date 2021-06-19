import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class FourthScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreen,
        title: Text("Statistics"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: WebView(
              initialUrl: "https://www.worldometers.info/coronavirus/country/india/",
              navigationDelegate: (NavigationRequest request) {
                return NavigationDecision.prevent;
              },
              javascriptMode: JavascriptMode.disabled,
            ),
          ),
        ],
      ),
    );
  }
}
