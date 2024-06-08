import 'package:flutter/material.dart';
import 'package:todo_list_provider/app/core/ui/theme_extensions.dart';

class Messages{
  final BuildContext context;
  Messages._(this.context);

  factory Messages.of(BuildContext context) {
    return Messages._(context);
  }

  // Shows an error message in a snack bar with the provided message.
  // void showError(String message){
  //   ScaffoldMessenger.of(context).showSnackBar(
  //     SnackBar(
  //       content: Text(message),
  //       backgroundColor: Colors.red,
  //       duration: const Duration(seconds: 6),
  //     ),
  //   );
  // }
  
  // Shows an information message in a snack bar with the provided message.
  // void showInfo(String message){
  //   ScaffoldMessenger.of(context).showSnackBar(
  //     SnackBar(
  //       content: Text(message),
  //       backgroundColor:context.primaryColor,
  //       duration: const Duration(seconds: 6),
  //     ),
  //   );
  // }

  void showError(String message)=>_showMessage(message, Colors.red);

  void showInfo(String message)=>_showMessage(message, context.primaryColor);

  void _showMessage(String message, Color color){
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: color,
        duration: const Duration(seconds: 6),
      ),
    );
  }

}
