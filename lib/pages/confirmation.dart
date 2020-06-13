import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tech/backend/controller/courses_controller.dart';
import 'package:tech/component/progress.dart';

class ConfirmSubmit extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      children: <Widget>[
        FutureBuilder(
            future: Provider.of<CourseController>(context).resrveCourse(),
            builder: (context, snap) {
              if (snap.hasError) {
                if (snap.data == true) {
                  return submitSuccess();
                } else {
                  return submitFailed();
                }
              } else {
                return Column(
                  children: <Widget>[
                    linearProgress(),
                    Container(
                      height: 70,
                      child: Text(''),
                    ),
                  ],
                );
              }
            }),
      ],
    );
  }
}

Widget submitSuccess() {
  return Text('yes');
}

Widget submitFailed() {
  return Text('No');
}
