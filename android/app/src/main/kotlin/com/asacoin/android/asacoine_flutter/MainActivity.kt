package com.asacoin.android.asacoine_flutter

import android.content.Intent
import android.net.Uri
import android.os.Bundle
import io.flutter.embedding.android.FlutterActivity
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugins.GeneratedPluginRegistrant

class MainActivity : FlutterActivity() {
    private val CHANNEL_INTENT = "com.asacoine.android/intent"
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        provideFlutterEngine(this)?.let { GeneratedPluginRegistrant.registerWith(it) }
        MethodChannel(
            flutterEngine?.dartExecutor!!,
            CHANNEL_INTENT
        ).setMethodCallHandler { call, result ->
            if (call.method.equals("sendUrl")) {
                val url: String = call.argument("web_url") ?: ""
                val intent = Intent(Intent.ACTION_VIEW, Uri.parse(url))
                startActivity(intent)
                result.success("ActivityStarted")
            } else {
                result.notImplemented()
            }
        }
    }
}
