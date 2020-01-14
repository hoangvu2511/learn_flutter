
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/model/feature/feed.dart';
import 'package:flutter_app/util.dart';

class FeedItem extends StatelessWidget {
  final Feed item;

  FeedItem({this.item});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        gotoDetailScreen(item, context);
      },
      child: Card(
        clipBehavior: Clip.antiAlias,
        borderOnForeground: true,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: 400.0,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                CachedNetworkImage(
                  imageUrl: item.attributes.posterImage.large,
                  placeholder: (context, url) => Container(
                    height: 200,
                    width: 200,
                    child: Center(
                      child: new CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation(Colors.deepPurpleAccent),
                      ),
                    ),
                  ),
                  errorWidget: (context, url, error) => new Icon(Icons.error),
                  width: 200.0,
                  height: 200.0,
                ),
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
                          Text("${item.attributes.averageRating}"),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}