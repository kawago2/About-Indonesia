import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/pahlawan_model.dart';
import '../utils/api.dart';

class PahlawanService {
  Future<List<Pahlawan>?> getKatakunci(String query) async {
    List<Pahlawan>? listPahlawan;
    var client = http.Client();

    var uri =
        Uri.parse('${PahlawanApiConstants.baseUrl}/api/heroes?q=$query');
    var response = await client.get(uri);
    print(jsonDecode(response.body));
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      var rest = data as List;
      print(rest);
      listPahlawan =
          rest.map<Pahlawan>((json) => Pahlawan.fromJson(json)).toList();
      print("List Size: ${listPahlawan.length}");
    } else {
      throw Exception('Failed to load album');
    }
    return listPahlawan;
  }

  Future<List<Pahlawan>?> getperiode(int start, end) async {
    List<Pahlawan>? listPahlawan;
    var client = http.Client();

    var uri = Uri.parse('${PahlawanApiConstants.baseUrl}/api/heroes?alive_in_start=$start&alive_in_end=$end');
    var response = await client.get(uri);
    print(jsonDecode(response.body));
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      var rest = data as List;
      print(rest);
      listPahlawan =
          rest.map<Pahlawan>((json) => Pahlawan.fromJson(json)).toList();
      print("List Size: ${listPahlawan.length}");
    } else {
      throw Exception('Failed to load album');
    }
    return listPahlawan;
  }
}
