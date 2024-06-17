
class HttpResponseValidator{
  static bool isValidStatusCode(int statusCode){
    if (statusCode>=200 && statusCode<300) {
      return true;
    } else {
      throw HttpException( statusCode);
    }
  }
}

class HttpException implements Exception{

  final int statusCode;
  HttpException(this.statusCode);

  @override
  String toString(){
    String message;
    switch(statusCode){
      case 400 :message= 'Bad request';
      break; 
     case 401 :message= 'Unauthorize';
      break; 
     case 403 :message= 'Forbidden';
      break; 
     case 409 :message= 'Conflict';
      break; 
      case 500 :message= 'Internal Server Error';
      break; 
     default:
     message = "Unknown Error";
    }
    return 'HTTPExeption Statuse Code $statusCode,msg$message';
  }
}