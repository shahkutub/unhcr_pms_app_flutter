
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/widgets.dart';

class Utils {


  static Future<bool> checkConnection() async{

    ConnectivityResult connectivityResult = await (new Connectivity().checkConnectivity());

    debugPrint(connectivityResult.toString());

    if ((connectivityResult == ConnectivityResult.mobile) || (connectivityResult == ConnectivityResult.wifi)){
      return Future<bool>.value(true);
    } else {
      return Future<bool>.value(false);
    }
  }

}