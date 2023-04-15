import 'package:flutter/foundation.dart';

class Post {
  final int kisi_id;
  final String kisi_ad;
  final String kisi_tel;

  Post({
    required this.kisi_id,
    required this.kisi_ad,
    required this.kisi_tel,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      kisi_id: json['kisi_id'] as int,
      kisi_ad: json['kisi_ad'] as String,
      kisi_tel: json['kisi_tel'] as String,
    );
  }

}