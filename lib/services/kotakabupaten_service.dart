import 'dart:convert';

import 'package:http/http.dart' as http;
import '../models/kotakabupaten_model.dart';
import '../utils/api.dart';

class KotaKabupatenService {
  Future<KotaKabupaten> getKotaKabupaten(String query) async {
    var client = http.Client();

    var uri = Uri.parse(KotaKabupatenApiConstants.baseUrl +
        KotaKabupatenApiConstants.usersEndpoint +
        query);
    var response = await client.get(uri);
    print(jsonDecode(response.body));
    if (response.statusCode == 200) {
      return KotaKabupaten.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load album');
    }
  }
}
