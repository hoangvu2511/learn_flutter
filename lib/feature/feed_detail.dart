import 'package:flutter/cupertino.dart';
import 'package:flutter_app/model/feature/feed.dart';

class FeedDetailPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final Feed item = ModalRoute.of(context).settings.arguments as Feed;
    return Container(
      child: Text(
          "${item.attributes.canonicalTitle}"
      ),
    );
  }
}
