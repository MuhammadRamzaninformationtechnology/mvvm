class AppExcuption implements Exception{
  final _message;
  final _prefix;
  AppExcuption([this._message,this._prefix]);
  String toString(){
    return '$_prefix$_message';

  }
}
class FetchDataException extends AppExcuption{
  FetchDataException([String? message]): super(message,'error During communication');
}


class BadRequestException extends AppExcuption{
   BadRequestException([String? message]): super(message,'Invalid Request');
}
class UnauthorisedException extends AppExcuption{
  UnauthorisedException([String? message]): super(message,'Unauthorised Request ');
}
class InvalidInputException extends AppExcuption{
  InvalidInputException([String? message]): super(message,'Invalid Input Request ');
}