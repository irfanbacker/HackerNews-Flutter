import 'package:flutter/material.dart';

class WebViewScreen extends StatelessWidget {
  WebViewScreen({Key key, this.url}) : super(key: key);

  final String url;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('webview'),
        backgroundColor: Colors.white,
      ),
      body: Container(),
    );
  }
}
