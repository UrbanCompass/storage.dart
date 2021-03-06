package com.compass.storage

import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import io.flutter.plugin.common.PluginRegistry.Registrar

class StoragePlugin: MethodCallHandler {
  companion object {
    @JvmStatic
    fun registerWith(registrar: Registrar) {
      val channel = MethodChannel(registrar.messenger(), "storage")
      channel.setMethodCallHandler(StoragePlugin())
    }
  }

  override fun onMethodCall(call: MethodCall, result: Result) {
    result.notImplemented()
  }
}
