import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Webviewscreen extends StatelessWidget {
  Webviewscreen({super.key, });
  final controller=WebViewController()..setJavaScriptMode(JavaScriptMode.disabled)..
  loadRequest(Uri.parse("https://www.facebook.com/groups/133079348938338/?hoisted_section_header_type=recently_seen&multi_permalinks=796972032549063"));

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
