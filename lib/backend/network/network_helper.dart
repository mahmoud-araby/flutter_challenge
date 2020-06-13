import 'dart:convert';

import 'package:connectivity/connectivity.dart';
import 'package:http/http.dart' as http;

import '../../config.dart';

class Network {
  Future<Map<String, dynamic>> getCourse() async {
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
}
