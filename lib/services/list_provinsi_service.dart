import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/list_provinsi_model.dart';
import '../utils/api.dart';

class ListProvinsiService {
  Future<ListProvinsi> getListProvinsi() async {
    var client = http.Client();

    var uri = Uri.parse(ListProvinsiApiConstants.baseUrl +
        ListProvinsiApiConstants.usersEndpoint);
    var response = await client.get(uri);
    print(jsonDecode(response.body));
    if (response.statusCode == 200) {
      return ListProvinsi.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load album');
    }
  }
}
