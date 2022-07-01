import 'dart:convert';

import 'package:http/http.dart' as http;
import '../models/faktaharian_model.dart';
import '../utils/api.dart';

class FaktaHarianService {
  Future<FaktaHarian> getFaktaHarian() async {
    var client = http.Client();

    var uri = Uri.parse(FaktaHarianApiConstants.baseUrl +
        FaktaHarianApiConstants.usersEndpoint);
    var response = await client.get(uri);
    print(jsonDecode(response.body));
    if (response.statusCode == 200) {
      return FaktaHarian.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load album');
    }
  }
}
