import 'package:flutter/material.dart';

class ShowNotification {
  void showMessage(String message,BuildContext context){
    showMessageNotifier(message, context, null, null);
  }
}

void showMessageNotifier(String message,BuildContext context,String? actrionlebale,  VoidCallback? onPressed){
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      behavior: SnackBarBehavior.floating,
      margin: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
      action: actrionlebale != null?
      SnackBarAction(label: actrionlebale, onPressed: onPressed!):
      null,
      backgroundColor: Colors.grey.shade600,
      content: 
    Text(
      message,
    style: const TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),),
    )
  );
}