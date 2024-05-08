import 'package:asacoine/src/webview/pull_to_refresh.dart';
import 'package:asacoine/src/webview/web_view_stack.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewApp extends StatefulWidget {
  const WebViewApp({super.key, required this.url});

  final String url;

  @override
  State<WebViewApp> createState() => _WebViewAppState();
}

class _WebViewAppState extends State<WebViewApp> {
  late final WebViewController controller;
  late DragGesturePullToRefresh dragGesturePullToRefresh;

  @override
  void initState() {
    super.initState();
    dragGesturePullToRefresh = DragGesturePullToRefresh(3000, 10);
    controller = WebViewController()
      ..loadRequest(
        Uri.parse(widget.url),
      );

    dragGesturePullToRefresh
        .setController(controller)
        .setDragHeightEnd(100)
        .setDragStartYDiff(100)
        .setWaitToRestart(3000);
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvoked: (didPop) async {
        if (await controller.canGoBack()) {
          await controller.goBack();
        } else {
          await Future.delayed(const Duration(milliseconds: 500));
          if (context.mounted) Navigator.pop(context);
        }
      },
      canPop: false,
      child: SafeArea(
        child: Scaffold(
          body: RefreshIndicator(
            triggerMode: RefreshIndicatorTriggerMode.onEdge,
            onRefresh: dragGesturePullToRefresh.refresh,
            child: Builder(
              builder: (context) {
                dragGesturePullToRefresh.setContext(context);
                return WebViewStack(
                  controller: controller,
                  dragGesturePullToRefresh: dragGesturePullToRefresh,
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
