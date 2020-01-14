import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/widget/loading.dart';

class ImageLoader extends StatelessWidget {
  final String url;
  ImageLoader({this.url});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: url,
      placeholder: (context, url) =>
          Container(
            height: 200,
            width: 200,
            child: CustomLoading(),
          ),
      errorWidget: (context, url, error) => new Icon(Icons.error),
      width: 200.0,
      height: 200.0,
    );
  }
}
