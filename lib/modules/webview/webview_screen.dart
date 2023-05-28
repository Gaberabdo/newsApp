import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class webview_screen extends StatelessWidget {
  var controller = WebViewController();

 webview_screen(this.controller, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: WebViewWidget(
        controller: controller,
      ),
    );
  }
}
