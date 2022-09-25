import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:restapi/models/postsmodel.dart';

getPosts() async {
  List<PostsModel> postslists = [];
  var url = "https://jsonplaceholder.typicode.com/posts";
  var data = await http.get(Uri.parse(url));
  var posts = await jsonDecode(data.body);
  for (var i in posts) {
    postslists.add(PostsModel.fromJson(i));
  }
  return postslists;
}
