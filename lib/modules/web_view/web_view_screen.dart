import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen extends StatelessWidget {
  final String url;
  final String title;

  const WebViewScreen({required this.url, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '$title',
          style: Theme.of(context).textTheme.headline1,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ),
      body: WebView(
        initialUrl: url,
      ),
    );
  }
}
