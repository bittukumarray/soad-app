import 'package:scoped_model/scoped_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../page/host.dart';
import 'package:jaguar_jwt/jaguar_jwt.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/auth.dart';
import './auth.dart';
import './userpost.dart';

class MainModel extends Model with AuthModel, PostModel {}
