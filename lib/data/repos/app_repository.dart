import 'package:e_com_app_firebase/data/remote/api_helper.dart';
import 'package:e_com_app_firebase/data/remote/api_urls.dart';

class AppRepo{

  ApiHelper? apiHelper;
  AppRepo({required this.apiHelper});

  Future<dynamic> registerRepo({required Map<String,dynamic> mBody})async{
    try{
     dynamic responseBody = await apiHelper!.postApi(url: ApiUrls.Register_url,isHeaderRequired: false,mBody: mBody);
     return responseBody;
    }catch(e){
      rethrow;
    }
  }

  Future<dynamic> loginRepo({required Map<String,dynamic> mBody})async{
    try{
      dynamic responseBody = await apiHelper!.postApi(url: ApiUrls.Login_url,mBody: mBody,isHeaderRequired: true);
      return responseBody;
    }catch(e){
      rethrow;
    }
  }
}