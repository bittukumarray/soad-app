import 'package:scoped_model/scoped_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../page/host.dart';
import 'package:jaguar_jwt/jaguar_jwt.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/auth.dart';
import './auth.dart';

class PostModel extends Model {
// /api/posts/

  List<dynamic> _postList = null;

  List<dynamic> get Postlist{
    return _postList;
  }

  void getPost() async {
    // print("in the getpost funct ");
    final String host = Host().host;
    // print("in the getpost funct before await ");
    final http.Response response = await http.get(
      '$host/api/posts/',
    );
    // print("in the getpost funct after await ");
    final List<dynamic> responseData = json.decode(response.body);

      print(responseData);

    _postList = responseData;

    // print(" post data is  $_postList");
      notifyListeners();
  }


}
