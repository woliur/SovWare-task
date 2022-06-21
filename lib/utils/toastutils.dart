import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';

class ToastUtils {

  static void showSuccess(String message) {
    showToast(
      message,
      textPadding: const EdgeInsets.all(10),
      duration: const Duration(seconds: 2),
      position: ToastPosition.center,
      backgroundColor: Colors.green,
      radius: 3.0,
      textStyle: const TextStyle(fontSize: 20.0),
    );
  }

  static void showError(String message) {
    showToast(
      message,
      textPadding: const EdgeInsets.all(10),
      duration: const Duration(seconds: 2),
      position: ToastPosition.center,
      backgroundColor: Colors.red,
      radius: 3.0,
      textStyle: const TextStyle(fontSize: 20.0),
    );
  }

  static void showInfo(String message) {
    showToast(
      message,
      textPadding: const EdgeInsets.all(10),
      duration: const Duration(seconds: 2),
      position: ToastPosition.center,
      backgroundColor: Colors.blue,
      radius: 3.0,
      textStyle: const TextStyle(fontSize: 20.0),
    );
  }

}
