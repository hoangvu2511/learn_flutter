import 'package:flutter/cupertino.dart';
import 'package:flutter_app/model/feature/list_anime_response.dart';

class FeedDetailPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final ListAnimeResponse item = ModalRoute.of(context).settings.arguments as ListAnimeResponse;
    return Container(
      child: Text(
          "${item.attributes.canonicalTitle}"
      ),
    );
  }
}
