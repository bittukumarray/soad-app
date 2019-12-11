import 'package:scoped_model/scoped_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../page/host.dart';


class PostModel extends Model {
// /api/posts/

  List<dynamic> _postList = null;

  List<dynamic> get Postlist {
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

    // print("Response data is $responseData");

    _postList = responseData;
    // print(" post data is  $_postList");
    notifyListeners();
  }
}

class LikeCommentModel extends Model {
  Map<dynamic, dynamic> _LikeResponse = null;

  Map<dynamic, dynamic> get LikeResponse {
    return _LikeResponse;
  }

  Future<Map<dynamic, dynamic>> postlike(String post_id, token) async {
    final String host = Host().host;
    // print("post_id is$post_id");
    // print("Token is $token");
    // print("in the getpost funct before await ");
    final http.Response response = await http
        .post('$host/api/posts/like/$post_id', headers: {
      "Content-Type": "application/x-www-form-urlencoded",
      "Authorization": token
    });
    // print("in the getpost funct after await ");
    final Map<dynamic, dynamic> responseData = json.decode(response.body);

    // print(responseData);
    if (responseData.containsKey('_id')) {
      notifyListeners();
      return {"status": "success", "code": 200, "data": responseData};
    } else {
      return {"status": "failed", "code": null};
    }
  }

  Future<Map<dynamic, dynamic>> postcomment(String post_id, String token,
      String avatar, String name, String comment) async {
    final String host = Host().host;
    // print("post_id is$post_id");
    // print("Token is $token");
    // print("Comment is $comment");
    // print("in the getpost funct before await ");
    final http.Response response = await http.post(
        '$host/api/posts/comment/$post_id',
        body: {"avatar": avatar, "text": comment, "name": name},
        headers: {"Authorization": token});
    // print("in the getpost funct after await ");
    final Map<dynamic, dynamic> responseData = json.decode(response.body);

    // print(responseData);
    if (responseData.containsKey('_id')) {
      notifyListeners();
      return {"status": "success", "code": 200, "data": responseData};
    } else {
      return {
        "status": "failed",
        "code": null,
      };
    }
  }
}
