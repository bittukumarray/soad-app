import 'package:scoped_model/scoped_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../page/host.dart';

class AuthModel extends Model {
  bool _isLoading = false;

  void login(String email, String password) async {
    final Map<String, dynamic> authData = {
      "email": email,
      "password": password
    };

    final String host = Host().host;

    final http.Response response = await http.post(
      '$host/api/users/login',
      body: authData,
      headers: {'Content-Type': 'application/json'},
    );

    


  }

  Future<Map<String, dynamic>> signup(
      String email, String name, String password, String password2) async {
    _isLoading = true;
    notifyListeners();
    print("in signup");
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
