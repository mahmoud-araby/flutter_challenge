import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tech/backend/controller/courses_controller.dart';
import 'package:tech/component/progress.dart';

import '../style.dart';

class ConfirmSubmit extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      children: <Widget>[
        FutureBuilder(
            future: Provider.of<CourseController>(context).resrveCourse(),
            builder: (context, snap) {
              if (snap.hasData) {
                return submitSuccess(context, snap.data);
              } else {
                return linearProgress();
              }
            }),
      ],
    );
  }
}

Widget submitSuccess(BuildContext context, bool done) {
  return Container(
    height: 200,
    width: 150,
    child: Column(
      children: <Widget>[
        Expanded(
          child: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              Container(
                alignment: AlignmentDirectional.center,
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Stack(
                      children: <Widget>[
                        Container(
                          width: 150,
                          height: 150,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              gradient: LinearGradient(
                                  begin: Alignment.bottomLeft,
                                  end: Alignment.topRight,
                                  colors: [
                                    done
                                        ? Colors.green.withOpacity(1)
                                        : Colors.red.withOpacity(1),
                                    done
                                        ? Colors.green.withOpacity(0.2)
                                        : Colors.red.withOpacity(0.2),
                                  ])),
                          child: Icon(
                            done ? Icons.check : Icons.error_outline,
                            color: Theme.of(context).scaffoldBackgroundColor,
                            size: 90,
                          ),
                        ),
                        Positioned(
                          right: -30,
                          bottom: -50,
                          child: Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                              color: Theme.of(context)
                                  .scaffoldBackgroundColor
                                  .withOpacity(0.15),
                              borderRadius: BorderRadius.circular(150),
                            ),
                          ),
                        ),
                        Positioned(
                          left: -20,
                          top: -50,
                          child: Container(
                            width: 120,
                            height: 120,
                            decoration: BoxDecoration(
                              color: Theme.of(context)
                                  .scaffoldBackgroundColor
                                  .withOpacity(0.15),
                              borderRadius: BorderRadius.circular(150),
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Text(
          done ? Done : UnDone,
          style: ConfirmationText,
        ),
      ],
    ),
  );
}

Widget submitFailed() {
  return Text('No');
}
