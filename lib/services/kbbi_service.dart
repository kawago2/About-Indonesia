import 'dart:convert';

import 'package:http/http.dart' as http;
import '../models/kbbi_model.dart';
import '../utils/api.dart';

class KbbiService {
  Future<Kbbi> getKbbi(String query) async {
    var client = http.Client();

    var uri = Uri.parse(
        KbbiApiConstants.baseUrl + KbbiApiConstants.usersEndpoint + query);
    var response = await client.get(uri);
    print(jsonDecode(response.body));
    if (response.statusCode == 200) {
      return Kbbi.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load album');
    }
  }
}










/*
class KbbiService {
  Future<List<Kbbi>?> getKbbi(String query) async {
    List<Kbbi>? listKbbi;
    var client = http.Client();

    var uri = Uri.parse(
        KbbiApiConstants.baseUrl + KbbiApiConstants.usersEndpoint + query);
    var response = await client.get(uri);
    print(jsonDecode(response.body)['data']);
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      var rest = data["data"] as List;
      print(rest);
      listKbbi = rest.map<Kbbi>((json) => Kbbi.fromJson(json)).toList();
      print("List Size: ${listKbbi.length}");
    } else {
      throw Exception('Failed to load album');
    }
    return listKbbi;
  }
}
*/