import 'package:flutter/material.dart';
import 'package:tech/backend/modules/course_module.dart';
import 'package:tech/backend/modules/respone_module.dart';
import 'package:tech/backend/network/network_helper.dart';

class CourseController extends ChangeNotifier {
  CourseController() {
    CourseController();
  }

  bool isBusy = false;
  Course courseData;
  CourseReservation courseReservation;
  GlobalKey<ScaffoldState> detailPageScaffold = GlobalKey<ScaffoldState>();

  GlobalKey<ScaffoldState> get coursesPageState => detailPageScaffold;

  getCourseDetails() async {
    isBusy = true;
    notifyListeners();
    Map response = await Network.getCourse();
    if (response.containsKey('error')) {
      courseData = null;
      showErrorSnackBar(response);
    } else {
      courseData = Course.fromJson(response);
    }
    isBusy = false;
    notifyListeners();
  }

  Future<bool> resrveCourse() async {
    bool ret;
    isBusy = true;
    notifyListeners();
    Map response = await Network.resrveCourse(courseReservation);
    if (response.containsKey('error')) {
      showErrorSnackBar(response);
      ret = false;
    } else {
      ret = true;
    }
    isBusy = false;
    notifyListeners();
    return ret;
  }

  void showErrorSnackBar(Map<String, String> error) {
    detailPageScaffold.currentState.showSnackBar(
      SnackBar(
        content: Text(
          error['error'],
        ),
        duration: Duration(seconds: 3),
      ),
    );
  }
}
