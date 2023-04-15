import 'dart:convert';
import 'package:http/http.dart';
import 'post_model.dart';


class http_service {
  final String postUrl = "http://flutter-deneme.epizy.com/db/tum_kisiler.php";

  Future<List<Post>> getPosts() async {
    Response res = await get(postUrl as Uri);

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);

      List<Post> posts = body
          .map(
            (dynamic item) => Post.fromJson(item),
          )
          .toList();
      return posts;
    } else {
      throw "Unable to retrieve posts";
    }
  }
}
