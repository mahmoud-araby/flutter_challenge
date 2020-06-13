import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'package:tech/backend/modules/course_module.dart';
import 'package:tech/backend/modules/respone_module.dart';
import 'package:tech/backend/network/network_helper.dart';

class CourseController extends ChangeNotifier {
  CourseController() {
    getCourseDetails();
  }

  bool isBusy = false;
  Course courseData;
  CourseReservation courseReservation = CourseReservation();
  final GlobalKey<ScaffoldState> detailPageScaffold =
      GlobalKey<ScaffoldState>();

  GlobalKey<ScaffoldState> get coursesPageState => detailPageScaffold;

  Future<void> getCourseDetails() async {
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
    Map response = await Network.resrveCourse(courseReservation);
    if (response.containsKey('error')) {
      showErrorSnackBar(response);
      ret = false;
    } else {
      ret = true;
    }
    return ret;
  }

  void showErrorSnackBar(Map error) {
    detailPageScaffold.currentState.showSnackBar(
      SnackBar(
        content: Text(
          error['error'],
        ),
        duration: Duration(seconds: 3),
      ),
    );
  }

  shareCourse() {
    Share.share('check out This Course  \"CourseLink\"');
  }

  Function get changeLike => () {
        courseData.isLiked = !courseData.isLiked;
        notifyListeners();
      };
}
