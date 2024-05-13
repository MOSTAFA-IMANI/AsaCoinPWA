import 'package:flutter/services.dart';

class Utils {
  static void launchUrl(String url) async {
    const MethodChannel platformChannel =
        MethodChannel("com.asacoine.android/intent");
    Map<String, dynamic> arguments = {'web_url': url};
    await platformChannel.invokeMethod('sendUrl', arguments);
  }
}
