import 'package:flutter/material.dart';

void showConfirmationDialog(
    BuildContext context, String title, String message, List<Widget> actions) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
          title: new Text(title), content: new Text(message), 
          actions: actions);
    },
  );
}
