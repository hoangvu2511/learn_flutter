import 'package:flutter/material.dart';
import 'package:flutter_app/model/feature/list_anime_response.dart';
import 'package:flutter_app/util.dart';
import 'package:flutter_app/widget/image_loader.dart';

class FeedItem extends StatelessWidget {
  final ListAnimeResponse item;

  FeedItem({this.item});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        gotoDetailScreen(item, context);
      },
      child: Card(
        clipBehavior: Clip.antiAlias,
        borderOnForeground: true,
        child: Container(
          width: 400.0,
          padding: EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ImageLoader(url: item?.attributes?.posterImage?.medium,),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "${item.attributes.canonicalTitle}",
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      softWrap: true,
                    ),
                    Row(
                      children: <Widget>[
                        Icon(Icons.star),
                        Text("${item.attributes.averageRating ?? 'N/A'}"),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}