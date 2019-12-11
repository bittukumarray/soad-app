import 'package:scoped_model/scoped_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../page/host.dart';
import 'package:jaguar_jwt/jaguar_jwt.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/auth.dart';

class AuthModel extends Model {
  bool _isLoading = false;
  User _authenticatedUser = null;

  User get user {
    return _authenticatedUser;
  }

  Future<Map<String, dynamic>> login(String email, String password) async {
    _isLoading = true;
    const String key = "secret";

    final Map<String, dynamic> authData = {
      "email": email,
      "password": password
    };

    final String host = Host().host;

    final http.Response response = await http.post(
      '$host/api/users/login',
      body: authData,
    );

    final Map<String, dynamic> responseData = json.decode(response.body);
    bool hasError = true;
    String message = "Something went wrong!";

    try {
      // Verify the signature in the JWT and extract its claim set
      final token = responseData['token'].replaceAll('Bearer ', '');
      final decClaimSet = verifyJwtHS256Signature(token, key);
      // print('JwtClaim: $decClaimSet\n');
      hasError = false;
      message = 'Logged in successfully';
      _authenticatedUser = User(
          name: decClaimSet["name"],
          id: decClaimSet["id"],
          avatar: decClaimSet["avatar"],
          token: responseData["token"],
          email: "abcd");

      final SharedPreferences pref = await SharedPreferences.getInstance();
      pref.setString('token', responseData['token']);
      pref.setString("id", decClaimSet["id"]);
      pref.setString("name", decClaimSet["name"]);
      pref.setString("avatar", decClaimSet["avatar"]);
      //  pref.setString("email", decClaimSet["email"]);

    } catch (e) {
      if (responseData.containsKey('email')) {
        message = responseData['email'];
      } else if (responseData.containsKey('password')) {
        message = responseData['password'];
      }
      hasError = true;
    }

    _isLoading = false;
    notifyListeners();
    // print(responseData);
    return {"hasError": hasError, "message": message};
  }

  void autoAuth() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    final String token = pref.getString('token');
    // print("token is $token");
    if (token != null) {
      final String name = pref.getString('name');
      final String avatar = pref.getString('avatar');
      final String id = pref.getString('id');
      // final String email = pref.getString("email");
      _authenticatedUser =
          User(name: name, id: id, token: token, avatar: avatar, email: "abcd");
      notifyListeners();
      // print("user is $id");
    }
  }

  void logout() async {
    // print('Logout');
    _authenticatedUser = null;
    final SharedPreferences pref = await SharedPreferences.getInstance();
    pref.remove("token");
    pref.remove("name");
    pref.remove("avatar");
    pref.remove("id");
    pref.remove("email");
  }

  Future<Map<String, dynamic>> signup(
      String email, String name, String password, String password2) async {
    _isLoading = true;
    notifyListeners();
    // print("in signup");
    final Map<String, dynamic> AuthData = {
      "email": email,
      "name": name,
      "password": password,
      "password2": password2
    };

    //  print(AuthData);
    final String host = Host().host;
    final http.Response response = await http.post('$host/api/users/register/',
        body: json.encode(AuthData),
        headers: {'Content-Type': 'application/json'});

    final Map<String, dynamic> responseData = json.decode(response.body);
    bool hasError = true;
    String message = "Something went wrong!";

    if (responseData.containsKey("_id")) {
      hasError = false;
      message = "You are Registered!";
    } else {
      hasError = true;
      if (responseData.containsKey("email")) {
        message = responseData['email'];
      } else if (responseData.containsKey("password")) {
        message = responseData['password'];
      } else if (responseData.containsKey("name")) {
        message = responseData['name'];
      }
    }

    _isLoading = false;
    notifyListeners();
    // print("in signup $hasError");
    // print(json.decode(response.body));
    return {"hasError": hasError, "message": message};
  }

  bool get isLoading {
    return _isLoading;
  }
}
