import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as httpClient;
import 'package:shared_preferences/shared_preferences.dart';

import 'app_exception.dart';
class ApiHelper{
  SharedPreferences?prefs;

  Future<dynamic> getApi({required String url,bool isHeaderRequired = true})async{
    Uri uri = Uri.parse(url);
    prefs = await SharedPreferences.getInstance();
    String token = prefs!.getString('UID')!;
    try{
      var res = await httpClient.get(uri,headers: isHeaderRequired?{
        "Authorization":
        "Bearer $token"
      }:null);
      return returnJsonResponse(res);
    }on SocketException catch (e) {
      throw (FetchDataException(errorMsg: "No Internet!!"));
    }
  }


  dynamic returnJsonResponse(httpClient.Response response) {
    switch (response.statusCode) {
      case 200:
        var data = jsonDecode(response.body);
        return data;
      case 300:
      case 400:
        throw BadRequestException(errorMsg: response.body.toString());
      case 403:
        throw UnauthourisedException(errorMsg: response.body.toString());
      case 500:
      case 502:
      default:
        throw FetchDataException(
            errorMsg: "There is a error while communicated with server");
    }
  }


  Future<dynamic> postApi({required String url,bool isHeaderRequired = true, Map<String,dynamic>?mBody})async{
    Uri uri = Uri.parse(url);
    prefs = await SharedPreferences.getInstance();
    String token = prefs!.getString('UID')??"";
    try{
      var res = await httpClient.post(
          uri,
          headers: isHeaderRequired?{
        "Authorization":
        "Bearer $token"
      }:null,
          body: jsonEncode(mBody??{}));
      return returnJsonResponse(res);
    }on SocketException catch (e) {
      throw (FetchDataException(errorMsg: "No Internet!!"));
    }
  }
}