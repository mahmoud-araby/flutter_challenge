import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));

    return ChangeNotifierProvider<CourseController>(
      create: (context) => CourseController(),
      builder: (context, child) => MaterialApp(
        theme: appTheme,
        debugShowCheckedModeBanner: false,
        title: 'Safari',
        home: Directionality(
            textDirection: TextDirection.rtl, child: CourseDetailPage()),
      ),
    );
  }
}
