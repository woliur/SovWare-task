import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';

class Network{
  static final instance = Network();
  Future<bool> checkNetwork() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      return false;
    }
    return true;
  }
}