import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:loader_overlay/loader_overlay.dart';

class Utils{

  static showLoader(BuildContext context){
    context.loaderOverlay.show();
  }

  static hideLoader(BuildContext context){
    final isVisible = context.loaderOverlay.visible;
    if(isVisible){
      context.loaderOverlay.hide();
    }
  }

  static showToast(BuildContext context,String message) {
    FlutterToast(context).showToast(
      child: Text(message),
      gravity: ToastGravity.BOTTOM,
    );
  }

}