import 'package:scoped_model/scoped_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
// import '../page/host.dart';

class GeneralNewModel extends Model {
  List<dynamic> _generalnewsList = null;
  Map<String, String> url_header = {
    "x-api-key": "f60f409e37364b1ab7f990a73fea2c2e"
  };
  String url = "https://newsapi.org/v2/top-headlines?";
  List<dynamic> get generalnews {
    return _generalnewsList;
  }

  void getGeneralnews() async {
    final String params = "category=general&country=in";

    final http.Response response =
        await http.get('$url$params', headers: url_header);

    final Map<dynamic, dynamic> responseData = json.decode(response.body);

    // print("Response data is $responseData");
    _generalnewsList = responseData["articles"];
    // print(" post data is  $_postList");
    notifyListeners();
  }
}

class HealthnewsModel extends Model {
  List<dynamic> _healthnewsList = null;
  Map<String, String> url_header = {
    "x-api-key": "f60f409e37364b1ab7f990a73fea2c2e"
  };
  String url = "https://newsapi.org/v2/top-headlines?";
  List<dynamic> get healthnews {
    return _healthnewsList;
  }

  void getHealthnews() async {
    final String params = "category=health&country=in";

    final http.Response response =
        await http.get('$url$params', headers: url_header);

    final Map<dynamic, dynamic> responseData = json.decode(response.body);

    // print("Response data is $responseData");
    _healthnewsList = responseData["articles"];
    // print(" post data is  $_postList");
    notifyListeners();
  }
}

class TechnologynewsModel extends Model {
  List<dynamic> _technologynewsList = null;
  Map<String, String> url_header = {
    "x-api-key": "f60f409e37364b1ab7f990a73fea2c2e"
  };
  String url = "https://newsapi.org/v2/top-headlines?";
  List<dynamic> get technologynews {
    return _technologynewsList;
  }

  void getTechnologynews() async {
    final String params = "category=technology&country=in";

    final http.Response response =
        await http.get('$url$params', headers: url_header);

    final Map<dynamic, dynamic> responseData = json.decode(response.body);

    // print("Response data is $responseData");
    _technologynewsList = responseData["articles"];
    // print(" post data is  $_postList");
    notifyListeners();
  }
}

class SportsnewsModel extends Model {
  List<dynamic> _sportsnewsList = null;
  Map<String, String> url_header = {
    "x-api-key": "f60f409e37364b1ab7f990a73fea2c2e"
  };
  String url = "https://newsapi.org/v2/top-headlines?";
  List<dynamic> get sportsnews {
    return _sportsnewsList;
  }

  void getSportsnews() async {
    final String params = "category=sports&country=in";

    final http.Response response =
        await http.get('$url$params', headers: url_header);

    final Map<dynamic, dynamic> responseData = json.decode(response.body);

    // print("Response data is $responseData");
    _sportsnewsList = responseData["articles"];
    // print(" post data is  $_postList");
    notifyListeners();
  }
}

class EntertainmentnewsModel extends Model {
  List<dynamic> _entertainmentnewsList = null;
  Map<String, String> url_header = {
    "x-api-key": "f60f409e37364b1ab7f990a73fea2c2e"
  };
  String url = "https://newsapi.org/v2/top-headlines?";
  List<dynamic> get entertainmentnews {
    return _entertainmentnewsList;
  }

  void getEntertainmentnews() async {
    final String params = "category=entertainment&country=in";

    final http.Response response =
        await http.get('$url$params', headers: url_header);

    final Map<dynamic, dynamic> responseData = json.decode(response.body);

    // print("Response data is $responseData");
    _entertainmentnewsList = responseData["articles"];
    // print(" post data is  $_postList");
    notifyListeners();
  }
}
