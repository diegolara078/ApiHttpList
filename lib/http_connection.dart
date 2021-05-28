import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'Post.dart';
import 'package:http/http.dart' as http;

Future<List<Post>> recuperarPostagens(http.Client client) async {
  final response =
      await client.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
  return compute(parsePostagens, response.body);
}

List<Post> parsePostagens(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<Post>((json) => Post.fromJson(json)).toList();
}
