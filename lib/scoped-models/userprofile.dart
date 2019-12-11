import 'package:scoped_model/scoped_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../page/host.dart';

class UserProfileModel extends Model {
  Map<dynamic, dynamic> _profile = null;
  Map<dynamic, dynamic>  get userProfile {
    return _profile;
  }

  void getUserProfile(token) async {
    final String host = Host().host;
    final http.Response response =
        await http.get('$host/api/profile/', headers: {"Authorization":token});

    final Map<dynamic, dynamic> responseData = json.decode(response.body);

    // print("Response data is $responseData");
    _profile = responseData;
    // print(" post data is  $_postList");
    notifyListeners();
  }
}