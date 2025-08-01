import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen extends StatelessWidget {
  const WebViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse('https://example.com'));

    return Scaffold(
      appBar: AppBar(title: const Text('Web View')),
      body: WebViewWidget(controller: controller)
          .animate()
          .fadeIn(duration: 500.milliseconds),
    );
  }
}