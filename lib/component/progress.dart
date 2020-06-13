import 'package:flutter/material.dart';

circularProgress() {
  return Center(
      child: CircularProgressIndicator(
    valueColor: AlwaysStoppedAnimation(
      Colors.purple,
    ),
  ));
}

linearProgress() {
  return LinearProgressIndicator(
    valueColor: AlwaysStoppedAnimation(
      Colors.purple,
    ),
  );
}
