import 'dart:convert';
import 'dart:developer';

import 'package:flutter_app/repository/base_repository.dart';
import 'package:http/http.dart' as http;

import '../constants.dart';

class AnimeRepository extends BaseListRepository {
  AnimeRepository(http.Client client) : super(client: client);

  @override
  Future<List> newCall(Map<String, String> mapParam) async {
    super.newCall(mapParam);
    var url = Uri.https(BASE_URL, "/api/edge/anime", mapParam);

    final response = await callApiGET(url);

    if (response.statusCode == 200 || response.statusCode == 201) {
      var body = json.decode(response.body);
      final data = body['data'] as List;

      nextLink = body["links"]["next"];

      log("total count = ${body["meta"]["count"]}");

      return [data.toList(), data
          .toList()
          .isEmpty || nextLink == null
      ];
    } else {
      throw Exception("error fetching");
    }
  }
}