import 'dart:convert' as convert;
import 'package:imei_storage/Model/model.dart';
import 'package:http/http.dart' as http;

class FormController {
  static const String post_URL =
      "https://script.google.com/macros/s/AKfycbzx3yc17hjAoxzojR_-XvDm2-mbOpdB78AktpOCA4M77wu7nU0HQPTpz26LJV6E813A/exec";
  static const String get_URL =
      "https://script.google.com/macros/s/AKfycby_PkuRa2DKEcvIox6ypcNeQieFihc93QHEq4geAYcHEyfNpvU/exec";

  static const STATUS_SUCCESS = "SUCCESS";

  void submitForm(ImeiModel imeiModel, void Function(String) callback) async {
    try {
      await http
          .post(Uri.parse(post_URL), body: imeiModel.toJson())
          .then((response) async {
        if (response.statusCode == 302) {
          var url = response.headers['location'];
          await http.get(Uri.parse(url!)).then((response) {
            callback(convert.jsonDecode(response.body)['status']);
          });
        } else {
          callback(convert.jsonDecode(response.body)['status']);
        }
      });
    } catch (e) {
      print(e);
    }
  }

  Future<List<ImeiModel>> getImei() async {
    return await http.get(Uri.parse(get_URL)).then((response) {
      var jsonImei = convert.jsonDecode(response.body) as List;
      return jsonImei.map((json) => ImeiModel.fromJson(json)).toList();
    });
  }
}
