


import 'package:mvvm/data/network/BaseApiServices.dart';
import 'package:mvvm/data/network/NetworkApiServices.dart';
import 'package:mvvm/res/app_url.dart';

class AuthRepositer{
baseapiService _apiServices=NetworkApiServices();

Future<dynamic>loginApi(dynamic data)async{
  try{
    dynamic responce =await _apiServices.postGetApiResponse(AppUrl.loginurl, data);
    return responce;
  }
      catch(e){
     throw e;
      }
}
Future<dynamic>registorApi(dynamic data)async{
  try{
    dynamic responce =await _apiServices.postGetApiResponse(AppUrl.register, data);
    return responce;
  }
  catch(e){
    throw e;
  }
},

}