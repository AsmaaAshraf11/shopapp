import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';
class CacheHelper{
static SharedPreferences? sharedPreferences;
static init()async{
  sharedPreferences=await SharedPreferences.getInstance();
}
static Future<bool> PutData({
  required String key,
  required bool value,
})async{
   return await sharedPreferences!.setBool(key, value);
}

   static dynamic  getData({
  required String key,
  //required bool value,
}){
   return  sharedPreferences?.get(key,);
}


static Future<bool> SaveData({
  required  key,
  required dynamic value,
})async{
 if(value is String )
    return await sharedPreferences!.setString(key, value);

    if(value is int )
    return await sharedPreferences!.setInt(key, value);

    if(value is bool )
    return await sharedPreferences!.setBool(key, value);

    
    return await sharedPreferences!.setDouble(key, value);

}
static Future<bool> removData({
  required String key,

})async{
 
    
    return await sharedPreferences!.remove(key);

}
} 