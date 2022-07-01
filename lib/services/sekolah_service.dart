import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/sekolah_model.dart';
import '../utils/api.dart';

class SekolahService {
  Future<Sekolah> getSekolahName(String query) async {
    var client = http.Client();

    var uri = Uri.parse(SekolahApiConstants.baseUrl +
        SekolahApiConstants.usersEndpoint +
        query);
    var response = await client.get(uri);
    print(jsonDecode(response.body));
    if (response.statusCode == 200) {
      return Sekolah.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load album');
    }
  }
}
