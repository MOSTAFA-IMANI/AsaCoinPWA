import 'dart:io';

import 'package:asacoine/src/urls.dart';
import 'package:asacoine/src/utils.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart' as image_picker;
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_flutter_android/webview_flutter_android.dart'
    as webview_flutter_android;
import 'package:webview_flutter_android/webview_flutter_android.dart';

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
            if (host.contains(AppUrls.baseUrlWithoutSchema)) {
              return NavigationDecision.navigate;
            } else {
              Utils.launchUrl(navigation.url);
              return NavigationDecision.prevent;
            }
          },
        ),
      )
      ..setJavaScriptMode(JavaScriptMode.unrestricted);
  }

  @override
  Widget build(BuildContext context) {
    _setAndroidWebViewControllerConfig();

    return Stack(
      children: [
        WebViewWidget(
          controller: widget.controller,
          gestureRecognizers: {Factory(() => widget.dragGesturePullToRefresh)},
        ),
        if (loadingPercentage < 100)
          LinearProgressIndicator(
            value: loadingPercentage / 100.0,
            minHeight: 2,
          ),
      ],
    );
  }

  void _setAndroidWebViewControllerConfig() {
    if (widget.controller.platform is AndroidWebViewController) {
      final myAndroidController =
          widget.controller.platform as AndroidWebViewController;
      myAndroidController.setMediaPlaybackRequiresUserGesture(false);
      myAndroidController.setOnShowFileSelector(_androidFilePicker);

      myAndroidController.setOnPlatformPermissionRequest(
        (request) {
          if (request.types.first == WebViewPermissionResourceType.camera ||
              request.types.first == WebViewPermissionResourceType.microphone) {
            _requestCameraAndMicrophone();
          }
          request.grant();
        },
      );
    }
  }

  void _requestCameraAndMicrophone() async {
    final statusCamera = Permission.camera.status;
    final statusMicrophone = Permission.microphone.status;
    if (!(await statusCamera.isGranted) ||
        !(await statusMicrophone.isGranted)) {
      await [Permission.camera, Permission.microphone].request();
    }
  }

  Future<List<String>> _androidFilePicker(
      webview_flutter_android.FileSelectorParams params) async {
    //request permission
    await [Permission.storage].request();

    if (params.acceptTypes.any((type) => type == 'image/*')) {
      final picker = image_picker.ImagePicker();
      final photo =
          await picker.pickImage(source: image_picker.ImageSource.camera);

      if (photo == null) {
        return [];
      }
      return [Uri.file(photo.path).toString()];
    } else if (params.acceptTypes.any((type) => type == 'video/*')) {
      final picker = image_picker.ImagePicker();
      final vidFile = await picker.pickVideo(
          source: ImageSource.camera, maxDuration: const Duration(seconds: 10));
      if (vidFile == null) {
        return [];
      }
      return [Uri.file(vidFile.path).toString()];
    } else {
      try {
        if (params.mode ==
            webview_flutter_android.FileSelectorMode.openMultiple) {
          final attachments =
              await FilePicker.platform.pickFiles(allowMultiple: true);
          if (attachments == null) return [];

          return attachments.files
              .where((element) => element.path != null)
              .map((e) => File(e.path!).uri.toString())
              .toList();
        } else {
          final attachment = await FilePicker.platform.pickFiles();
          if (attachment == null) return [];
          File file = File(attachment.files.single.path!);
          return [file.uri.toString()];
        }
      } catch (e) {
        return [];
      }
    }
  }
}
