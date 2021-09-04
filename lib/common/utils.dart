import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Utils {
  static toast(dynamic str) {
    Fluttertoast.showToast(
        msg: str.toString(),
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 3,
        fontSize: 15.0);
  }

  static errorToast(dynamic str) {
    Fluttertoast.showToast(
        msg: str,
        timeInSecForIosWeb: 3,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 13.0);
  }
}
