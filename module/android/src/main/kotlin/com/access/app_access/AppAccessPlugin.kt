package com.access.app_access
import androidx.annotation.NonNull
import android.os.Bundle
import android.content.Context
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import io.flutter.plugin.common.PluginRegistry.Registrar
import android.content.pm.PackageInfo
import android.content.pm.PackageManager
import android.content.pm.Signature
import android.content.pm.PackageManager.GET_SIGNATURES

import android.util.Log

class AppAccessPlugin : FlutterPlugin , MethodCallHandler  {
  private lateinit var channel : MethodChannel
  private lateinit var applicationContext : Context


 override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
   this.applicationContext = flutterPluginBinding.getApplicationContext()
    channel = MethodChannel(flutterPluginBinding.binaryMessenger, "flutter/appaccess")
    channel.setMethodCallHandler(this)
    Factory.setup(this, flutterPluginBinding.binaryMessenger)
  }

   override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {
    if (call.method == "checkAccess") {
       var check : Boolean 
     check= AppAcc.isDeviceRooted()
      result.success(check)
    }else if(call.method == "getSignature") {
 var signatures = this.applicationContext.getPackageManager().getPackageInfo(applicationContext.getPackageName(),PackageManager.GET_SIGNATURES).signatures
          var key: String = signatures[0].toCharsString()
         val usergetValue: String? = call.argument<String>("value")
          var value: String = Utils.encrypt(key,usergetValue)
          result.success(value)
    }else if(call.method == "encrypt_data") {
          var key: String? = call.argument<String>("maintext")
         val usergetValue: String? = call.argument<String>("value")
          var value: String = EncryptUtil.encrypt(key,usergetValue)
          result.success(value)
    }else if(call.method == "decrypt_data"){
       var key: String? = call.argument<String>("maintext")
         val usergetValue: String? = call.argument<String>("value")
          var value: String = DecryptUtil.decrypt(key,usergetValue)
          result.success(value)
    }else{
      result.notImplemented()
    }
  }

  @Override
  override fun onDetachedFromEngine( binding : FlutterPlugin.FlutterPluginBinding) {
    channel.setMethodCallHandler(null)
  }

  private companion object Factory{
    fun setup(plugin : AppAccessPlugin,binaryMessenger: BinaryMessenger){

    }
  }
}
