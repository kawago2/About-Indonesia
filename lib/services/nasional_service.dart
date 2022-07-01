import 'dart:convert';

import 'package:http/http.dart' as http;
import '../models/nasional_model.dart';
import '../utils/api.dart';

class NasionalService {
  Future<Nasional> getNasional() async {
    var client = http.Client();

    var uri = Uri.parse(
        NasionalApiConstants.baseUrl + NasionalApiConstants.usersEndpoint);
    var response = await client.get(uri);
    print(jsonDecode(response.body));
    if (response.statusCode == 200) {
      return Nasional.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load album');
    }
  }
}
