import 'dart:convert';
import 'package:http/http.dart' as http;

class HttpStateful {
  String? id, name, email, ava;

  HttpStateful({this.id, this.name, this.email, this.ava});

  static Future<HttpStateful> connectAPI(String id) async {
    Uri url = Uri.parse("https://reqres.in/api/users/$id");

    var result = await http.get(url);
    var data = (json.decode(result.body))["data"];
    print(data["avatar"]);

    return HttpStateful(
        id: data["id"].toString(),
        name: data["first_name"],
        email: data["email"],
        ava: data["avatar"]);
  }
}
