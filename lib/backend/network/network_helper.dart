import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:tech/backend/modules/respone_module.dart';

import '../../config.dart';

Map<String, dynamic> ConnectionError = {
  "error": 'Verify your network connection'
};
Map<String, dynamic> ServerError = {"error": 'Server have some issues'};

class Network {
  static Future<Map> getCourse() async {
    Map<String, dynamic> ret;
    try {
      http.Response data = await http.get(CourseDetailsApi);
      if (data.statusCode == 200 || data.statusCode == 201) {
        ret = jsonDecode(data.body);
      } else {
        ret = ConnectionError;
      }
    } catch (e) {
      ret = ConnectionError;
    }
    return ret;
  }

  // ignore: missing_return
  static Future<Map> resrveCourse(CourseReservation response) async {
    Map<String, dynamic> ret;
    Map data = response.toMap();

    /// send data to backend for course reservation
    /// for demonstration purpose delay is presented here
    await Future.delayed(Duration(seconds: 4));
    ret = {'isOk': 'ok'};
    return ret;
  }
}
