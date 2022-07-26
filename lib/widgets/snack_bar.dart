import 'package:flutter/material.dart';


SnackBar snack_bar(String message,){

  final snackBar = SnackBar(
    content: Text(message),
    action: SnackBarAction(
      label: 'Undo',
      onPressed: () {
        // Some code to undo the change.
      },
    ),
  );

  return snackBar;
}
