import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/kelurahan_model.dart';
import '../utils/api.dart';

class KelurahanService {
  Future<Kelurahan> getKelurahan(String query) async {
    var client = http.Client();

    var uri = Uri.parse(KelurahanApiConstants.baseUrl +
        KelurahanApiConstants.usersEndpoint +
        query);
    var response = await client.get(uri);
    print(jsonDecode(response.body));
    if (response.statusCode == 200) {
      return Kelurahan.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load album');
    }
  }
}
