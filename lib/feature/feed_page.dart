import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/widget/feed_item.dart';
import 'package:flutter_app/widget/feed_item_more.dart';
import 'package:flutter_app/feature/type.dart';
import 'package:flutter_app/model/feature/list_anime_response.dart';
import 'package:flutter_app/util.dart';
import 'package:http/http.dart' as http;

class FeedPage extends StatefulWidget {
  @override
  _FeedPageState createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  var items = List<ListAnimeResponse>();

  @override
  void initState() {
    super.initState();
    getListAnime().then((value) {
      setState(() {
        value.add(ListAnimeResponse());
        items = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var viewHolder = items.map((item) {
      if (item.id == null) {
        return FeedItemMore(type: TypeAorM.ANIME,);
      }
      return FeedItem(item: item,);
    }).toList(growable: true);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: [
              Text("Anime",),
              Spacer(),
              GestureDetector(
                onTap: (){
                  gotoMoreAnime(context, TypeAorM.ANIME);
                },
                  child: Text("More")
              ),
            ],
          ),
          Expanded(
            child: ListView(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              children: [
                Wrap(
                  children: viewHolder,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<List<ListAnimeResponse>> getListAnime() async {
    var response = await http.get(
        "https://kitsu.io/api/edge/anime"
    );
    return (json.decode(response.body)["data"] as List)?.map((it) {
      return ListAnimeResponse.fromJson(json.encode(it));
    })?.toList();
  }
}