
import 'package:dio/dio.dart';

class DResponse {
  dynamic data;
  int status;
  String message;

  DResponse({required this.data,required this.status,required this.message});

  factory DResponse.fromResponse(dynamic response) {
    if(response is Response){
      return DResponse(data: response.data,status: response.statusCode??-9999,message: response.statusMessage??"");
    }else if(response is DioException){
     return _handleDioError(response);
    } else {
      return DResponse(data: null,status: -1000,message: 'Unknown Dio Error: ${response.message}');
    }
  }

 static DResponse _handleDioError(DioException e) {
    if (e.response != null) {
      switch (e.response!.statusCode) {
        case 400:
          return DResponse(
            data: e.response!.data,
            message: 'Bad Request: ${e.response!.data}',
            status: 400
          );
        case 401:
          return DResponse(
              data: e.response!.data,
              message: 'Unauthorized: ${e.response!.data}',
              status: 401
          );
        case 403:
          return DResponse(
              data: e.response!.data,
              message: 'Forbidden: ${e.response!.data}',
              status: 403
          );
        case 404:
          return DResponse(
              data: e.response!.data,
              message: 'Not Found: ${e.response!.data}',
              status: 404
          );
        case 500:
          return DResponse(
              data: e.response!.data,
              message: 'Internal Server Error: ${e.response!.data}',
              status: 500
          );
        default:
          return DResponse(
              data: e.response!.data,
              message: 'Unknown Error: ${e.response!.statusCode} - ${e.response!.data}',
              status: -1000
          );
      }
    }
    else {
      if (e.type == DioExceptionType.connectionTimeout) {
        return DResponse(
            data: null,
            message: 'Connection Timeout: ${e.message}',
            status: -1000
        );
      } else if (e.type == DioExceptionType.receiveTimeout) {
        return DResponse(
            data: null,
            message: 'Receive Timeout: ${e.message}',
            status: -1000
        );
      } else if (e.type == DioExceptionType.badCertificate) {
        return DResponse(
            data: null,
            message: 'Bad Certificate: ${e.message}',
            status: -1000
        );
      } else if (e.type == DioExceptionType.cancel) {
        return DResponse(
            data: null,
            message: 'Request Cancelled: ${e.message}',
            status: -1000
        );
      } else {
        return DResponse(
            data: null,
            message: 'Unknown Dio Error: ${e.message}',
            status: -1000
        );
      }
    }
  }
}