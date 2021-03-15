import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_auth/model/response/post_model.dart';
import 'package:flutter_auth/model/response/user_model.dart';
import 'package:meta/meta.dart';
import 'package:flutter_auth/model/request/user_param.dart';
import 'package:flutter_auth/network/app_url.dart';
import 'package:http/http.dart' as http;

class Network {
  Future<User> login({@required UserParam param}) async {
    try {
      final url = AppUrl.user + '?email=${param.email}&zipcode=${param.password}';
      debugPrint('url is $url');
      final response = await http
          .get(url);
      if (response.statusCode == 200) {
        final result = json.decode(response.body) as List<dynamic>;
        return User.fromJson(result.first);
      } else {
        throw LoginException();
      }
    } catch (e) {
      throw HttpException(e);
    }
  }
  
  Future<PostsModel> posts() async {
    try {
      final response = await http.get(AppUrl.post);
      if (response.statusCode == 200) {
        final result = PostsModel.fromJson(json.decode(response.body));
        return result;
      } else {
        throw PostException();
      }
    } catch(e) {
      throw HttpException(e);
    }
  }
}

class LoginException implements Exception {}
class PostException implements Exception {}
