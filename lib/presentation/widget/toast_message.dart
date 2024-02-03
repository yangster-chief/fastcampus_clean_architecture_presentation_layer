import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

///
/// clean_architecture_layer_exam
/// File Name: toast_message
/// Created by sujangmac
///
/// Description:
///
void showToastMessage(String message) {
  Fluttertoast.showToast(
    msg: message,
    gravity: ToastGravity.TOP,
    fontSize: 20,
    backgroundColor: Colors.green,
    textColor: Colors.white,
    toastLength: Toast.LENGTH_SHORT,
  );
}
