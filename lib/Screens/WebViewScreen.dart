import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class WebViewScreen extends StatelessWidget {
  WebViewScreen({Key key, this.url}) : super(key: key);

  final String url;

  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      appBar: AppBar(
        title: Text('webview'),
        backgroundColor: Colors.white,
        elevation: 10.0,
      ),
      initialChild: Center(
        child: CircularProgressIndicator(),
      ),
      withZoom: true,
      url: url,
    );
  }
}
