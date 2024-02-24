import 'package:dio/dio.dart';

class DioHelper{
static  Dio dio=Dio();
static init(){
  dio=Dio(
    BaseOptions(
      baseUrl: 'https://student.valuxapps.com/api/',
    receiveDataWhenStatusError: true,
    headers: {
    'Content-Type' :'application/json',
    'lang':'en',
    },
    
    )
  );
}
   static Future<Response> getData({required String url, Map<String,dynamic>? query,
    required String token, })async{
       dio.options.headers=
         {
          'lang':'en',
    'Content-Type' :'application/json',

          'Authorization':token
        };
       return await dio.get(url,queryParameters: query,);

  }
   static Future<Response> PostData({
    required String url,
     Map<String,dynamic>? query,
    required Map<String,dynamic> Data,
    String lang='en',
    String? token,
    })async{
       dio.options.headers=
         {
          'lang':lang,
    'Content-Type' :'application/json',

          'Authorization':token
        };
       
    return dio.post(
      url,queryParameters: query,
      data: Data,


    );
   }


static Future<Response> PutData({
    required String url,
     Map<String,dynamic>? query,
    required Map<String,dynamic> Data,
    String lang='en',
    String? token,
    })async{
       dio.options.headers=
         {
          'lang':lang,
    'Content-Type' :'application/json',

          'Authorization':token
        };
       
    return dio.put(
      url,queryParameters: query,
      data: Data,


    );
   }
}