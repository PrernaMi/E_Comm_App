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
  
  Future<dynamic> getCategory()async{
    try{
      dynamic responseBody = await apiHelper!.getApi(url: ApiUrls.Category_url);
      return responseBody;
    }catch(e){
      rethrow;
    }
  }
  
  Future<dynamic> getProduct()async{
    try{
      dynamic responseBody = await apiHelper!.postApi(url: ApiUrls.Product_url);
      return responseBody;
    }catch(e){
      rethrow;
    }
  }

  Future<dynamic> addToCart({required Map<String, dynamic> bodyParams})async{
    try{
      dynamic responseBody = await apiHelper!.postApi(url: ApiUrls.Cart_url,mBody: bodyParams);
      return responseBody;
    }catch(e){
      rethrow;
    }
  }

  Future<dynamic> profileInfo()async{
    try{
      dynamic responseBody = await apiHelper!.postApi(url: ApiUrls.Profile_url);
      return responseBody;
    }catch(e){
      rethrow;
    }
  }

  Future<dynamic> decreaseProduct({required Map<String,dynamic> mBody})async{
    try{
      dynamic responseBody = await apiHelper!.postApi(url: ApiUrls.Decrease_Product_url,mBody: mBody);
      return responseBody;
    }catch(e){
      rethrow;
    }
  }

  Future<dynamic> getViewCart()async{
    try{
      dynamic responseBody = await apiHelper!.getApi(url: ApiUrls.ViewCart_url);
      return responseBody;
    }catch(e){
      rethrow;
    }
  }

  Future<dynamic> deleteCart({required Map<String,dynamic> Body})async{
    try{
      dynamic responseBody = await apiHelper!.postApi(url: ApiUrls.Delete_Cart_url,mBody: Body);
      return responseBody;
    }catch(e){
      rethrow;
    }
  }
}