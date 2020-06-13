import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import './progress.dart';

customImage(String mediaUrl) {
  return Container(
    child: CachedNetworkImage(
      fit: BoxFit.cover,
      imageUrl: mediaUrl,
      placeholder: (context, url) {
        return Center(
          child: circularProgress(),
        );
      },
      errorWidget: (context, url, error) {
        return Center(
          child: Icon(Icons.error),
        );
      },
    ),
  );
}
