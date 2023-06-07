

import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';

import '../app_excuption.dart';
import 'BaseApiServices.dart';
import 'package:http/http.dart' as http;

class NetworkApiServices extends baseapiService{
  @override
  Future getGetApiResponse(String url) async{
    dynamic responseJson;
  try{

  final response =await http.get(Uri.parse(url)).timeout(Duration(seconds: 10));
  responseJson= returnResponse(response);
  }on SocketException{
   throw FetchDataException('NO internet connection');
  }
  return responseJson;
  }

  @override
  Future postGetApiResponse(String url,dynamic data)async {
    dynamic responseJson;
    try{

      Response response= await post(
        Uri.parse(url),
        body: data
      ).timeout(Duration(seconds: 10));
      responseJson= returnResponse(response);
    }on SocketException{
      throw FetchDataException('NO internet connection');
    }
    return responseJson;
  }
  dynamic returnResponse(http.Response response){
    switch(response.statusCode){
      case 200:
    dynamic responseJson = jsonDecode(response.body);

        return responseJson;
      case 200:
        throw BadRequestException(response.body.toString());
        case400:
      case 404:
        throw UnauthorisedException (response.body.toString());
      default:
        throw FetchDataException('Error accured while the communicating with server'
            +'with status code'+response.statusCode.toString());

    }
  }
  
}