import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'http_service.dart';
import 'post_model.dart';

class PostsPage extends StatelessWidget {
  final http_service httpService = HttpService() as http_service;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Posts"),
      ),
      body: FutureBuilder(
        future: httpService.getPosts(),
        builder: (BuildContext context, AsyncSnapshot<List<Post>> snapshot) {
          if (snapshot.hasData) {
            List<Post>? posts = snapshot.data;
            return ListView(
              children: posts!
                  .map(
                    (Post post) => ListTile(
                  title: Text(post.kisi_ad),
                  subtitle: Text("${post.kisi_id}"),
                ),
              )
                  .toList(),
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}

class HttpService {
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
