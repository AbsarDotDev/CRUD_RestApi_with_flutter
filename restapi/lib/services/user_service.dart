import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:restapi/models/usermodel.dart';

getUsers() async {
  var url = "https://maaz-api.tga-edu.com/api/users";
  var data = await http.get(Uri.parse(url));
  var posts = await jsonDecode(data.body);

  return UserModel.fromJson(posts);
}

addUser(Data userModel) async {
  http.post(
    Uri.parse('https://maaz-api.tga-edu.com/api/users'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(userModel.toJson()),
  );
}

updateUser(Data userModel, int id) async {
  http.put(
    Uri.parse('https://maaz-api.tga-edu.com/api/users/$id'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(userModel.toJson()),
  );
}

deleteUser(int id) async {
  http.delete(
    Uri.parse('https://maaz-api.tga-edu.com/api/users/$id'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );
}
