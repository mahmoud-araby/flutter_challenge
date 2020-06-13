import 'dart:convert';

import 'package:connectivity/connectivity.dart';
import 'package:http/http.dart' as http;
import 'package:tech/backend/modules/respone_module.dart';

import '../../config.dart';

class Network {
  static Future<Map<String, dynamic>> getCourse() async {
    Map<String, dynamic> ret;
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      ret = ConnectionError;
    } else {
      try {
        http.Response data = await http.get(CourseDetailsApi);
        if (data.statusCode == 200 || data.statusCode == 201) {
          ret = jsonDecode(data.body);
        } else {
          ret = ServerError;
        }
      } catch (e) {
        ret = ServerError;
      }
    }
    return ret;
  }

  // ignore: missing_return
  static Future<Map<String, dynamic>> resrveCourse(
      CourseReservation response) async {
    Map<String, dynamic> ret;
    Map data = response.toMap();
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      ret = ConnectionError;
    } else {
      /// send data to backend for course reservation
      /// for demonstration purpose delay is presented here
      await Future.delayed(Duration(seconds: 4));
      ret = {'isOk': 'ok'};
    }
    return ret;
  }
}
