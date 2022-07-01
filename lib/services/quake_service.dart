import 'dart:convert';

import 'package:http/http.dart' as http;
import '../models/quake_model.dart';
import '../utils/api.dart';

class QuakeService {
  Future<Quake> getQuake() async {
    var client = http.Client();

    var uri =
        Uri.parse(QuakeApiConstants.baseUrl + QuakeApiConstants.usersEndpoint);
    var response = await client.get(uri);
    print(jsonDecode(response.body)['Infogempa']['gempa']);
    if (response.statusCode == 200) {
      return Quake.fromJson(jsonDecode(response.body)['Infogempa']['gempa']);
    } else {
      throw Exception('Failed to load album');
    }
  }
}
