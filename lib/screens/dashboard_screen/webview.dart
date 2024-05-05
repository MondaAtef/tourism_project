import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Webviewscreen extends StatelessWidget {
  Webviewscreen({super.key, });
  final controller=WebViewController()..setJavaScriptMode(JavaScriptMode.disabled)..
  loadRequest(Uri.parse("https://www.google.com/search?gs_ssp=eJzj4tTP1TcwtDBIMjVg9GLNKa3ILwIAKmQE-Q&q=luxor&oq=&gs_lcrp=EgZjaHJvbWUqCQgCEC4YJxjqAjIJCAAQIxgnGOoCMg8IARAuGCcYxwEY6gIY0QMyCQgCEC4YJxjqAjIJCAMQIxgnGOoCMgkIBBAjGCcY6gIyCQgFECMYJxjqAjIJCAYQIxgnGOoCMgkIBxAjGCcY6gLSAQoxOTkwMThqMGo3qAIIsAIB&sourceid=chrome&ie=UTF-8"));

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('50'.tr,style: const TextStyle(
            color: Colors.black,
            fontSize: 15.0,
            fontWeight: FontWeight.bold
        ),),
      ),
      body: WebViewWidget(
        controller: controller,
      ),
    );
  }
}
