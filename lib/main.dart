import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'src/web_view_stack.dart';
import 'src/pull_to_refresh.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const WebViewApp(),
    );
  }
}

class WebViewApp extends StatefulWidget {
  const WebViewApp({super.key});

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
        Uri.parse('https://asacoine.com'),
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
          SystemNavigator.pop(animated: true);
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
