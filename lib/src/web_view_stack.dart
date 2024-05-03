import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'pull_to_refresh.dart';

class WebViewStack extends StatefulWidget {
  const WebViewStack(
      {required this.controller,
      required this.dragGesturePullToRefresh,
      super.key});

  final WebViewController controller;
  final DragGesturePullToRefresh dragGesturePullToRefresh;

  @override
  State<WebViewStack> createState() => _WebViewStackState();
}

class _WebViewStackState extends State<WebViewStack> {
  var loadingPercentage = 0;

  @override
  void initState() {
    super.initState();
    widget.controller
      ..enableZoom(true)
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (url) {
            setState(() {
              loadingPercentage = 0;
            });
            widget.dragGesturePullToRefresh.started();
          },
          onProgress: (progress) {
            setState(() {
              loadingPercentage = progress;
            });
          },
          onPageFinished: (url) {
            setState(() {
              loadingPercentage = 100;
            });
            widget.dragGesturePullToRefresh.finished();
          },
          onWebResourceError: (WebResourceError error) {
            widget.dragGesturePullToRefresh.finished();
          },
          onNavigationRequest: (navigation) {
            final host = Uri.parse(navigation.url).host;
            if (host.contains('asacoine.com')) {
              return NavigationDecision.navigate;
            } else {
              launchUrl(navigation.url);
              return NavigationDecision.prevent;
            }
          },
        ),
      )
      ..setJavaScriptMode(JavaScriptMode.unrestricted);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        WebViewWidget(
          controller: widget.controller,
          gestureRecognizers: {Factory(() => widget.dragGesturePullToRefresh)},
        ),
        if (loadingPercentage < 100)
          LinearProgressIndicator(
            value: loadingPercentage / 100.0,
          ),
      ],
    );
  }

  void launchUrl(String url) async {
    log('tag: $url');
    const MethodChannel platformChannel =
        MethodChannel("com.asacoine.android/intent");
    Map<String, dynamic> arguments = {'web_url': url};
    await platformChannel.invokeMethod('sendUrl', arguments);
  }
}
