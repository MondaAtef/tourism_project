import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebviewScreen extends StatefulWidget {
  @override
  _WebviewScreenState createState() => _WebviewScreenState();
}

class _WebviewScreenState extends State<WebviewScreen> {
  late WebViewController _controller;

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse("https://www.google.com/search?gs_ssp=eJzj4tTP1TcwtDBIMjVg9GLNKa3ILwIAKmQE-Q&q=luxor&oq=&gs_lcrp=EgZjaHJvbWUqCQgFEC4YJxjqAjIJCAAQIxgnGOoCMgkIARAjGCcY6gIyCQgCECMYJxjqAjIJCAMQIxgnGOoCMg8IBBAuGCcYxwEY6gIY0QMyCQgFEC4YJxjqAjIJCAYQIxgnGOoCMgkIBxAjGCcY6gLSAQkzMzc3ajBqMTWoAgiwAgE&sourceid=chrome&ie=UTF-8"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '50'.tr,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 15.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: WebViewWidget(
        controller: _controller,
      ),
    );
  }
}
