import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/model/feature/list_anime_response.dart';
import 'package:flutter_app/util.dart';
import 'package:flutter_app/widget/image_loader.dart';

class FeedItemPortrait extends StatelessWidget {

  final ListAnimeResponse item;

  FeedItemPortrait({this.item});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        gotoDetailScreen(item, context);
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              ImageLoader(url: item.attributes?.posterImage?.medium),
              Text(
                "${item.attributes.canonicalTitle}",
                overflow: TextOverflow.ellipsis,
                softWrap: true,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.star),
                  Text("${item.attributes.averageRating ?? 'N/A'}"),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
