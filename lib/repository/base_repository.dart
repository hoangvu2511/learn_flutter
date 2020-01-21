import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

abstract class BaseListRepository {
  final http.Client client;
  var nextLink;

  BaseListRepository({this.client});

  Future<dynamic> newCall(Map<String, String> mapParam) async {}

  Future<dynamic> fetch() async {
    final response = await callApiGET(nextLink);

    if (response.statusCode == 200 || response.statusCode == 201) {
      var body = json.decode(response.body);
      final data = body['data'] as List;

      nextLink = body["links"]["next"];

      return [data.toList(), data
          .toList()
          .isEmpty || nextLink == null
      ];
    } else {
      throw Exception("error fetching");
    }
  }

  Future<dynamic> callApiGET(url) {
    log('call api ' + url.toString());

    return client.get(url);
  }
}