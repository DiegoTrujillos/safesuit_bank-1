package com.example.safesuit_bank

import io.androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugins.GeneratedPluginRegistrant

class MainActivity: FlutterActivity() {
    override fun configureFlutterEngine(@NonNull FlutterEngine: FlutterEngine){
        GeneratedPluginRegistrant.registerWith(FlutterEngine)
    }
}
