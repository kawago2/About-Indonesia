import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/kecamatan_model.dart';
import '../utils/api.dart';

class KecamatanService {
  Future<Kecamatan> getKecamatan(String query) async {
    var client = http.Client();

    var uri = Uri.parse(KecamatanApiConstants.baseUrl +
        KecamatanApiConstants.usersEndpoint +
        query);
    var response = await client.get(uri);
    print(jsonDecode(response.body));
    if (response.statusCode == 200) {
      return Kecamatan.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load album');
    }
  }
}
