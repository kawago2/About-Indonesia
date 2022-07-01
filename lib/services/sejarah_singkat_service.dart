import 'package:html/parser.dart' as parser;
import 'package:http/http.dart' as http;

class SejarahSingkatService {
  Future<List<String>> getSejarahSingkat() async {
    final response = await http.Client()
        .get(Uri.parse('https://id.wikipedia.org/wiki/Sejarah_Indonesia'));
    if (response.statusCode == 200) {
      var document = parser.parse(response.body);
      try {
        var responseString1 =
            document.getElementsByClassName('mw-parser-output')[0].children[3];
        print(responseString1.text.trim());
        return [
          responseString1.text.trim(),
        ];
      } catch (e) {
        return ['', '', 'ERROR!'];
      }
    } else {
      return ['', '', 'ERROR: ${response.statusCode}.'];
    }
  }
}
