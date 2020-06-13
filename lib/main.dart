import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tech/backend/controller/courses_controller.dart';
import 'package:tech/pages/course_details_page.dart';
import 'package:tech/style.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CourseController>(
      create: (context) => CourseController(),
      builder: (context, child) => MaterialApp(
        theme: appTheme,
        debugShowCheckedModeBanner: false,
        title: 'Courses',
        home: CourseDetailPage(),
      ),
    );
  }
}
